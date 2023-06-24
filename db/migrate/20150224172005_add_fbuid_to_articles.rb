class AddFbuidToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :fbuid, :string
  end
end
