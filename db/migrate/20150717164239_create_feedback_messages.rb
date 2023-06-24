class CreateFeedbackMessages < ActiveRecord::Migration
  def change
    create_table :feedback_messages do |t|
      t.string :name
      t.string :email
      t.string :content
      t.string :feedback_type
      t.timestamps
    end
  end
end
