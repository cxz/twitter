class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :nickname, :null => false
      t.timestamps
    end

    add_index :admins, :nickname
  end
end
