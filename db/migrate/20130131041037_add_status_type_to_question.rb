class AddStatusTypeToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :open, :boolean, :null => false, :default => true
    add_column :questions, :kind, :integer, :null => false, :default => Question::KIND_MESSAGE
  end
end
