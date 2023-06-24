# == Schema Information
#
# Table name: feedback_messages
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  email         :string(255)
#  content       :string(255)
#  feedback_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class FeedbackMessage < ActiveRecord::Base
  include GlobalConstants

  validates :name, presence: true, length: { maximum: 120 }
  validates :email, presence: true, length: { maximum: 120 },format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :content, presence: true, length: { maximum: 1200 } 
  validates :feedback_type, presence: true, inclusion: {in: GlobalConstants::FEEDBACK_TYPE}
end
