class Cancellation < ActiveRecord::Base
  validates :tweet_id, uniqueness: true

  def html_snippet
    "<a href=#{url} target='_blank'>#{location.titlecase} (#{levels.downcase})</a>"
  end
end
