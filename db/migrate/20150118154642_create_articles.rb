class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.integer :vote_count, :default => 0
      t.integer :comment_count, :default => 0
      t.boolean :is_visible, :default => false

      t.timestamps
    end
  end
end
