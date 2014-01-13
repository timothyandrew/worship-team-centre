class SongListsController < ApplicationController
  def new
    @song_list = SongList.new(done_on: Date.today)
  end

  def create
    song_list = SongList.new(song_list_params)
    if song_list.save
      flash[:notice] = "Your song list was successfully created."
      redirect_to song_list_path(song_list)
    else
      flash[:error] = "There was an error saving your song list."
      render :new
    end
  end

  def edit
    @song_list = SongList.find(params[:id])
  end

  def update
    song_list = SongList.find(params[:id])
    if song_list.update_clearing_song_list_items(song_list_params)
      flash[:notice] = "Your song list was successfully updated."
      redirect_to song_list_path(song_list)
    else
      flash[:error] = "There was an error saving your song list."
      render :edit
    end
  end

  def index
    @song_lists = SongList.order("done_on DESC")
  end

  def show
    @song_list = SongList.find(params[:id])
  end

  private

  def song_list_params
    params.require(:song_list).permit!
  end
end
