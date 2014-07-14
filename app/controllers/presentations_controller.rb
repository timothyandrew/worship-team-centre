class PresentationsController < ApplicationController
  def create
    song = Song.find(params[:song_id])
    presentation = Presentation.new(song)
    if file = presentation.generate
      send_data file.to_str, filename: "#{song.name}.pptx"
    else
      flash[:alert] = "Couldn't generate the presentation. Sorry!"
      redirect_to :back
    end
  end
end
