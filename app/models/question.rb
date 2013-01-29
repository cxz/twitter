class Question < ActiveRecord::Base
  attr_accessible :text, :answer

  has_many :replies, :foreign_key => :question_uid, :primary_key => :uid

  def post
    tweet = Twitter.update(self.text)
    puts "TWEET: #{tweet}"
    puts "ID: #{tweet.id_str}"
  end

  def answer!(text)
    transaction do
      self.answer = text
      self.replies.update_all({:is_correct => false})
      self.replies.update_all({:is_correct => true}, ['lower(text) like lower(?)', "%#{self.answer}"])

      self.save!
    end
  end
end
