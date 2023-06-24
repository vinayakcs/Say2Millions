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

require 'test_helper'

class FeedbackMessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
