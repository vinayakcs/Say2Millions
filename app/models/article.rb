# == Schema Information
#
# Table name: articles
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  description   :text
#  vote_count    :integer          default(0)
#  comment_count :integer          default(0)
#  is_visible    :boolean          default(FALSE)
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :string(255)
#  view_count    :integer          default(0)
#  fbuid         :string(255)
#  image_url     :string(255)
#  category      :string(255)
#

class Article < ActiveRecord::Base
 include GlobalConstants
 include ActionView::Helpers::TextHelper
 has_many :comments, :as => :commentable
 has_many :votes
 belongs_to :user
 profanity_filter :description, :title
 validates :description, presence: true, length: { maximum: 2000 }
 validates :title,presence: true, length: { maximum: 320 }
 is_impressionable :counter_cache => true, :column_name => :view_count

 validates :category,presence: true, inclusion: {in: GlobalConstants::CATEGORIES}
 
 scope :visible, lambda { where('is_visible = true') }
 scope :get_todays_articles,lambda{ where("DATE(created_at)=DATE(?)",Time.now).first }

 def self.get(id)
  article_id=id.partition('-').first
  where('id=?',article_id).visible.first
 end

 def self.get_category_list
  GlobalConstants::CATEGORIES
 end

 def self.get_sort_types
  GlobalConstants::SORT_TYPE
 end

 def self.todays_article_count
  where("created_at >= ?",Time.zone.now.beginning_of_day).count
 end

 def self.get_articles_with_category(categ)
   where("category=?",categ).visible
 end
 
 def self.get_articles_by_user(user_id)
  user=User.find(user_id)
  user.articles.visible if !user.nil?
 end


 def self.get_articles_with_sort(sort)
  if sort.nil?
   order('created_at DESC')
  else
   if sort==GlobalConstants::SORT_TYPE_TRENDING
    order("power((abs(view_count+vote_count)/(date_part('second',current_timestamp-created_at))),1.5) desc")
   elsif sort==GlobalConstants::SORT_TYPE_VIEW
    order('view_count DESC')
   elsif sort==GlobalConstants::SORT_TYPE_RECENT
    order('created_at DESC')
   elsif sort==GlobalConstants::SORT_TYPE_VOTE
    order('vote_count DESC')
   end
  end
 end

#5 article per page
 def self.get_articles_for_show(id)
  articles=Article.visible.limit(5)
  articles=articles.offset((id.to_i-1)*5) if !id.nil?
  return articles
 end

# def article_params
#   params.require(:article).permit(:content, :tag_list => [])
# end

 def to_param
  [id,truncate(title, :length => 60).parameterize].join('-')
 end

 def update_vote_count(is_increment,value)
  if is_increment==true
   increment!(:vote_count, value)
  else
   decrement!(:vote_count, value)
  end
 end

 def update_comment_count(is_increment,value)
  if is_increment==true
   increment!(:comment_count, value)
  else
   decrement!(:comment_count, value)
  end
 end

 def get_relative_link
  "articles/"+to_param
 end

end
