require 'cgi'

class SongDecorator < Draper::Decorator
  delegate_all

  def youtube_url
    search_term = CGI.escape(song.name)
    "https://www.youtube.com/results?search_query=#{search_term}"
  end
end
