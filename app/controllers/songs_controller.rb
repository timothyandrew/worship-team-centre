class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    song = Song.new(song_params)
    if song.save
      track_event("Created song.", {song: song.attributes})
      flash[:notice] = "Your song was successfully created."
      redirect_to song_path(song)
    else
      flash[:error] = "There was an error saving this song. Please review"
      @song = song
      render :new
    end
  end

  def edit
    @song = Song.not_deleted.find(params[:id])
  end

  def update
    song = Song.not_deleted.find(params[:id])
    if song.update(song_params)
      track_event("Updated song.", {song: song.attributes})
      flash[:notice] = "Your song was successfully updated."
      redirect_to song_path(song)
    else
      flash[:error] = "There was an error saving your song."
      @song = song
      render :edit
    end
  end

  def index
    @songs = SongDecorator.decorate_collection(Song.not_deleted.apply_ordering(params[:sort], params[:order]))
    ActiveRecord::Associations::Preloader.new(@songs, :song_lists).run
  end

  def show
    @song = Song.not_deleted.find(params[:id]).decorate
  end


  def destroy
    song = Song.not_deleted.find(params[:id])
    if song.song_lists.not_deleted.present?
      flash[:error] = "That song is belongs to more than one worship set. It can't be deleted."
    elsif song.soft_delete
      flash[:notice] = "The song was deleted."
    else
      flash[:error] = "There was an error deleting the song."      
    end
    redirect_to song_lists_path
  end

  private

  def song_params
    params.require(:song).permit!
  end
end
