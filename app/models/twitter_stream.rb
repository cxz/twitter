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
      #text
      #in_reply_to_status_id

      puts "on_timeline: #{status.user.id} #{status.in_reply_to_status_id} #{status.text}"
    end

    @client.on_delete do |status_id, user_id|
      puts "on_delete: #{status_id} #{user_id}"
    end

    @client.on_limit do |skip_count|
      puts "on_limit: #{skip_count}"
    end

    @client.userstream

  end



end