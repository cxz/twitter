class CreateHeartBeats < ActiveRecord::Migration
  def change
    create_table :heartbeats do |t|
      t.boolean :alive, :null => false
      t.string :last_tweet_uid
      t.timestamps
    end
  end

end
