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

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
