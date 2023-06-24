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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
