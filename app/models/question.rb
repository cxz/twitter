class Question < ActiveRecord::Base
  attr_accessible :text, :answer

  def post
    tweet = Twitter.update(self.text)
    puts "TWEET: #{tweet}"
    puts "ID: #{tweet.id_str}"
  end
end
