class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :email
      t.string :provider
      t.string :last_name
      t.boolean :is_banned
      t.integer :post_count

      t.timestamps
    end
  end
end
