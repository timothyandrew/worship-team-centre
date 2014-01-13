class SongListsController < ApplicationController
  def new
    @song_list = SongList.new(done_on: Date.today)
  end

  def create
    song_list = SongList.new(params[:song_list])
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
    if song_list.update(params[:song_list])
      flash[:notice] = "Your song list was successfully updated."
      redirect_to song_list_path(song_list)
    else
      flash[:error] = "There was an error saving your song list."
      render :edit
    end
  end

  def index
    @song_lists = SongList.order(:done_on)
  end
end
