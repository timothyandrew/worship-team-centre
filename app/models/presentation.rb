class Presentation
  def initialize(song)
    @song = song
  end

  def generate
    RestClient.get "#{Figaro.env.ppt_generator_url}/presentations", params: {title: @song.name, body: @song.lyrics}
  end
end
