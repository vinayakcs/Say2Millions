class RemoveIsvisibleFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :isvisible, :boolean
  end
end
