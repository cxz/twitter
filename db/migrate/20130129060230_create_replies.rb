class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :uid, :null => false
      t.string :text, :null => false
      t.string :user_uid, :null => false
      t.string :question_uid, :null => false
      t.timestamps
    end

    add_index :replies, :user_uid
    add_index :replies, :question_uid
  end
end
