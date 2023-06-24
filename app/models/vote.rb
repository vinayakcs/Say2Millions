# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  article_id :integer
#  user_uid   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  vote_type  :string(255)
#

class Vote < ActiveRecord::Base
#polymorphic allows future entity additions which needs voting
 belongs_to :user
 belongs_to :article


 def self.getVoteCountOfUserForArticle(user_id,article_id)
  where("user_id=? and article_id=?",user_id,article_id).count
 end
 def self.getVoteByUserForArticle(userId,articleId)
  where("user_id=? and article_id=?",userId,articleId).first
 end
end
