class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :article_id
      t.string :user_uid
      t.timestamps
    end
  end
end
