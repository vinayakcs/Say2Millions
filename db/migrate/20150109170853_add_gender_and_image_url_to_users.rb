class AddGenderAndImageUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :image_url, :string
  end
end
