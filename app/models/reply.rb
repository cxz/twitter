class Reply < ActiveRecord::Base
  attr_accessible :uid, :text, :user_uid, :question_uid

  belongs_to :question, :foreign_key => :question_uid, :primary_key => :uid

end
