class RemovePublishedDateFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :published_date, :datetime
  end
end
