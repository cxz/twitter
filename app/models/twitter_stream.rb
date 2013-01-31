class TwitterStream

  def initialize
    @client = TweetStream::Client.new
  end

  def run
    Heartbeat.ping
    EM.run do
        timer = EM::PeriodicTimer.new(5) do
          Heartbeat.ping
        end

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

        puts "Listening"
        @client.userstream

      end

    end

  protected

  def save_reply(user_uid, question_uid, text, uid)
    #if reply for same question+user already exists, just replace
    reply = Reply.where(:user_uid => user_uid, :question_uid => question_uid).first
    if reply.nil?
      Reply.create(:user_uid => user_uid, :question_uid => question_uid, :text => text, :uid => uid)
    else
      reply.text = text
      reply.uid = uid
      reply.save!
    end
    Heartbeat.update_last_tweet! uid

  end



end