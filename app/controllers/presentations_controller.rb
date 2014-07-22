class PresentationsController < ApplicationController
  def create
    song = Song.find(params[:song_id])
    presentation = Presentation.new(song)
    if file = presentation.generate
      track_event("Generated presentation for single song.", {song: song.name})
      send_data file.to_str, filename: "#{song.name}.pptx"
    else
      flash[:alert] = "Couldn't generate the presentation. Sorry!"
      redirect_to :back
    end
  end

  def bulk_create
    song_list = SongList.find(params[:song_list_id])
    presentation = BulkPresentation.new(song_list)
    if file = presentation.generate
      track_event("Generated presentation for song list.", {songs: song_list.songs.pluck(:name)})
      filename = song_list.done_on.present? ? song_list.done_on.strftime("%-d %b %Y") : "presentation"
      send_data file.to_str, filename: "#{filename}.pptx"
    else
      flash[:alert] = "Couldn't generate the presentation. Sorry!"
      redirect_to :back
    end
  end
end
