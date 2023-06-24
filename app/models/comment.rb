# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  description      :text
#  created_at       :datetime
#  updated_at       :datetime
#  commentable_id   :integer
#  commentable_type :string(255)
#  user_uid         :string(255)
#

class Comment < ActiveRecord::Base
 belongs_to :commentable, :polymorphic => true
 validates_presence_of  :description
 scope :recent, lambda {order('updated_at DESC')}

end
