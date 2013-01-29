class AddColumnsToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :answer, :string
    add_column :questions, :uid, :string
  end
end
