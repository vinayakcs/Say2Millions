class AddIndexToUsersUidAndProvider < ActiveRecord::Migration
  def change
   add_index :users, [:uid,:provider]
  end
end
