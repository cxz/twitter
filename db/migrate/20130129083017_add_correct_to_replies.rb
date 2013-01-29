class AddCorrectToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :is_correct, :boolean, :default => false
  end
end
