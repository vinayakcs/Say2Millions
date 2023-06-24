class AddUserUidToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_uid, :string
  end
end
