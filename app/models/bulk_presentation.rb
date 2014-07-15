class BulkPresentation
  def initialize(song_list)
    @songs = song_list.songs
  end

  def generate
    RestClient.post "#{Figaro.env.ppt_generator_url}/bulk_presentations", {"titles" => @songs.pluck(:name).to_json, "bodies" => @songs.pluck(:lyrics).to_json}, :content_type => :json, :accept => :json
  end
end
