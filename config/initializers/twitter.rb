CONSUMER_KEY = 'TWITTER_CONSUMER_KEY'
CONSUMER_SECRET = 'TWITTER_CONSUMER_SECRET'
OAUTH_TOKEN = 'TWITTER_OAUTH_TOKEN'
OAUTH_TOKEN_SECRET = 'TWITTER_OAUTH_TOKEN_SECRET'


if ENV[CONSUMER_KEY].blank? or ENV[CONSUMER_SECRET].blank? or ENV[OAUTH_TOKEN].blank? or ENV[OAUTH_TOKEN_SECRET].blank?
  raise %Q{
==========================
Need to set the following environment variables before starting: #{CONSUMER_KEY}, #{CONSUMER_SECRET}, #{OAUTH_TOKEN}, #{OAUTH_TOKEN_SECRET}"
==========================
}

end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV[CONSUMER_KEY], ENV[CONSUMER_SECRET]
end

Twitter.configure do |config|
  config.consumer_key       = ENV[CONSUMER_KEY]
  config.consumer_secret    = ENV[CONSUMER_SECRET]
  config.oauth_token        = ENV[OAUTH_TOKEN]
  config.oauth_token_secret = ENV[OAUTH_TOKEN_SECRET]
end

TweetStream.configure do |config|
  config.consumer_key       = ENV[CONSUMER_KEY]
  config.consumer_secret    = ENV[CONSUMER_SECRET]
  config.oauth_token        = ENV[OAUTH_TOKEN]
  config.oauth_token_secret = ENV[OAUTH_TOKEN_SECRET]
  config.auth_method        = :oauth
end

