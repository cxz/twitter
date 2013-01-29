class TwitterStream

  def initialize
    @client = TweetStream::Client.new
  end

  def run
    @client.on_error do |message|
      puts "on error: #{message}"
    end

    @client.on_direct_message do |direct_message|
      puts "on_direct_message: #{direct_message}"
    end

    @client.on_timeline_status do |status|
      text = status.text
      question_uid = status.in_reply_to_status_id
      user_uid = status.user.id
      uid = status.id
      puts "on_timeline: #{status.user.id} #{question_uid} #{text}"

      if !text.blank? and !question_uid.blank? and !user_uid.blank?
        save_reply(user_uid, question_uid, text, uid)
      end
    end

    @client.on_delete do |status_id, user_id|
      puts "on_delete: #{status_id} #{user_id}"
    end

    @client.on_limit do |skip_count|
      puts "on_limit: #{skip_count}"
    end

    @client.userstream

  end

  protected

  def save_reply(user_uid, question_uid, text, uid)
    Reply.create(:user_uid => user_uid, :question_uid => question_uid, :text => text, :uid => uid)
  end



end