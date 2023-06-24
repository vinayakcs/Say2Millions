class AddIsluckyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :islucky, :boolean, :default => false
  end
end
