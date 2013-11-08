class TweetParser
  def initialize(options={})
    @text     = options[:text]
    @splitter = @text.split('|')
    @matcher  = @splitter[1].match(/Classes in (.+) are suspended (.+)/)
  end

  def levels
    @matcher[1]
  end

  def suspended_until
    Date.parse @matcher[2]
  end

  def location
    @splitter[0].gsub('(Update) ', '').strip
  end
end
