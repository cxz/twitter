class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  has_many :replies, :foreign_key => :user_uid, :primary_key => :uid


  def score
    self.replies.where(:is_correct => true).count
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  def self.standings
    connection.select_all(%Q{
    select users.uid, users.name,
      (select count(*) from replies where replies.user_uid = users.uid) as answers,
      (select count(*) from replies where replies.user_uid = users.uid and replies.is_correct) as score
      from users})
  end

end
