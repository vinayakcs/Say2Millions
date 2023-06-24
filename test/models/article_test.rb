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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
