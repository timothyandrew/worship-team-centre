require 'cgi'

class SongDecorator < Draper::Decorator
  delegate_all

  def youtube_url
    search_term = CGI.escape(song.name)
    "https://www.youtube.com/results?search_query=#{search_term}"
  end

  def last_done_on
    if model.last_done_on.present?
      "#{h.time_ago_in_words(model.last_done_on)} ago"
    else
      "Never Done"
    end
  end
end
