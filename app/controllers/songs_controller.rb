class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    song = Song.new(params[:song])
    if song.save
      flash[:notice] = "Your song was successfully created."
      redirect_to song_path(song)
    else
      flash[:error] = "There was an error saving this song. Please review"
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    song = Song.find(params[:id])
    if song.update(params[:song])
      flash[:notice] = "Your song was successfully updated."
      redirect_to song_path(song)
    else
      flash[:error] = "There was an error saving your song."
      render :edit
    end
  end

  def index
    @songs = Song.order(:created_at)
  end
end
