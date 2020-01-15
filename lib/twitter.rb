require 'twitter'

class Tweet

  rhetoric = Rhetoric.last(5)
  rhetoric.each do |r|
    @text = []
    @text.push(r.meigen)
  end

  @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV[CONSUMER_KEY]
    config.consumer_secret     = ENV[CONSUMER_SECRET]
    config.access_token        = ENV[ACCESS_TOKEN]
    config.access_token_secret = ENV[ACCESS_SECRET]
  end

  def random_tweet
    tweet = @text[rand(@text.length)]
    update(tweet)
  end

  private

  def update(tweet)
    begin
      @client.update(tweet)
    rescue => e
      nil #TODO
    end
  end
end

# random_tweetを実行する
if __FILE__ == $0
  Tweet.new.random_tweet
end