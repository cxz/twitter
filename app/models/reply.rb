class Reply < ActiveRecord::Base
  attr_accessible :uid, :text, :user_uid, :question_uid
end
