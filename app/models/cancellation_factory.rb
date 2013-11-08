class CancellationFactory
  def initialize(options={})
    @tweet_id        = options[:tweet_id]
    @text            = options[:text]
    @url             = "https://twitter.com/DepEd_PH/status/#{@tweet_id}"
    @parser          = TweetParser.new(text: @text)
    @levels          = @parser.levels
    @suspended_until = @parser.suspended_until
    @location        = @parser.location
  end

  def create_cancellation!
    Cancellation.create(tweet_id: @tweet_id, text: @text, levels: @levels,
      suspended_until: @suspended_until, location: @location, url: @url)
  end
end
