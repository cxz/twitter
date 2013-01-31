class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :nickname, :image

  has_many :replies, :foreign_key => :user_uid, :primary_key => :uid

  def is_admin?
    self.admin
  end

  def valid_replies
    self.replies.valid
  end

  def score
    self.valid_replies.where(:is_correct => true).count
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
    select s.* from (
    select users.uid, users.name, users.nickname, users.image, users.id,
      (select count(*) from replies, questions where questions.uid = replies.question_uid and questions.kind <> 0 and replies.user_uid = users.uid) as answers,
      (select count(*) from replies, questions where questions.uid = replies.question_uid and questions.kind <> 0 and replies.user_uid = users.uid and replies.is_correct) as score
      from users) s order by score desc, s.id asc
    })
  end

end
