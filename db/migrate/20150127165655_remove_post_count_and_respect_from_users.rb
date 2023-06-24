class RemovePostCountAndRespectFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :post_count, :integer
    remove_column :users, :respect, :integer
  end
end
