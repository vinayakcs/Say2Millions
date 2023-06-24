# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  uid              :string(255)
#  email            :string(255)
#  provider         :string(255)
#  last_name        :string(255)
#  is_banned        :boolean
#  created_at       :datetime
#  updated_at       :datetime
#  gender           :string(255)
#  user_description :text
#  article_count    :integer          default(0)
#  comment_count    :integer          default(0)
#  islucky          :boolean          default(FALSE)
#  remember_token   :string(255)
#

class User < ActiveRecord::Base
 has_many :comments, :as => :commentable
 has_many :votes
 has_many :articles
 has_one  :unpublishedarticle
 validates_presence_of  :provider, :uid
 validates :name, presence: true, length: { maximum: 50 }
 validates :last_name, presence: true, length: { maximum: 50 }
 validates :user_description, length: { maximum: 520 }

 validates_uniqueness_of :uid
 before_save {self.email=email.downcase unless email.nil?}
 @@maxVotePermissible =1

 def self.getLuckyUserCount
  where("islucky=true").count
 end

 def self.getLuckyUser
  self.joins(:unpublishedarticle).order('RANDOM()').first
 #self.joins("left outer join articles on articles.user_id=users.uid").where("articles.user_id is null").order("RANDOM()").first
 end

 def to_param
  [id,name.parameterize].join("-")
 end

 def self.setChosenUser(user)
  @chosenUser=user
 end
 def self.getChosenUser
  @chosenUser ||= self.where("islucky=true").first
 end 
 
 def self.create_with_omniauth(om_hash)
  create! do |user|
   user.provider=om_hash["omniauth.auth"]['provider']
   user.uid=om_hash["omniauth.auth"]['uid']
   user.email=om_hash["omniauth.auth"]['info']['email']
   user.name=om_hash["omniauth.auth"]['info']['first_name']
   user.last_name=om_hash["omniauth.auth"]['info']['last_name']
   user.gender=om_hash["omniauth.auth"]['extra']['raw_info']['gender']
  end
 end

 def getVoteForArticle(articleId)
  vote=Vote.getVoteByUserForArticle(id,articleId)
  return vote
 end

 def canVoteForArticle(articleId)
  voteCount = Vote.getVoteCountOfUserForArticle(id,articleId)
  if voteCount >= @@maxVotePermissible
   false
  else
   true
  end
 end

 def update_article_count(is_increment)
  if is_increment==true
   User.increment_counter :article_count, id
  else
   decrement_counter :article_count, id
  end
 end

 def update_comment_count(is_increment)
  if is_increment==true
   User.increment_counter(:comment_count, id)
  else
   User.decrement_counter(:comment_count, id)
  end
 end

 def get_relative_link
  "user"+[id,name.parameterize].join("-")
 end



 #keep trying until a uuid is got; size is 9, 4/3 of 9 is 12
 def self.get_remember_token
  begin
   rand_token=SecureRandom.hex(6)
  end while User.exists?(:remember_token => rand_token)
   rand_token
 end



end
