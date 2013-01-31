class Heartbeat < ActiveRecord::Base
  attr_accessible :alive, :last_tweet_uid, :updated_at

  def self.ping
    hb = Heartbeat.get
    if hb.nil?
      create(:alive => true)
    else
      hb.update_attributes!(:alive => true, :updated_at => DateTime.now)
    end
  end

  def self.update_last_tweet!(uid)
    Heartbeat.first.update_attributes!(:alive => true, :last_tweet_uid => uid)
  end

  def self.get
    Heartbeat.first
  end

  def is_alive?
    self.alive && self.updated_at > DateTime.now - 60
  end

end
