class TwitterWorker
  include Sidekiq::Worker

  def perform
    t = Twitter.user_timeline('DepEd_PH')
    t.each do |tweet|
      h = tweet.hashtags
      if (h.any? { |tag| tag.text == "walangpasok" }) && matches_pattern?(tweet.text)
        CancellationFactory.new(tweet_id: tweet.id, text: tweet.text).create_cancellation!
      end
    end
  end

  # TODO: This is very naive for now. Need Regexp help.
  def matches_pattern?(text)
    text.split('|').count == 3
  end
end