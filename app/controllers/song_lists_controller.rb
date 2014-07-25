class SongListsController < ApplicationController
  def new
    @song_list = SongList.new(done_on: Date.today)
  end

  def create
    song_list = SongList.new(song_list_params)
    if song_list.save
      track_event("Created song list.", {songs: song_list.songs.pluck(:name), song_list: song_list.attributes})
      flash[:notice] = "Your worship set was successfully created."
      redirect_to song_lists_path
    else
      flash[:error] = "There was an error saving your worship set."
      render :new
    end
  end

  def edit
    @song_list = SongList.not_deleted.find(params[:id])
  end

  def update
    @song_list = SongList.not_deleted.find(params[:id])
    if @song_list.update_clearing_song_list_items_and_team_members(song_list_params)
      track_event("Updated song list.", {songs: @song_list.songs.pluck(:name), song_list: @song_list.attributes})
      flash[:notice] = "Your worship set was successfully updated."
      redirect_to song_lists_path
    else
      flash[:error] = "There was an error saving your worship set."
      render :edit
    end
  end

  def index
    @song_lists = SongList.not_deleted.order("done_on DESC")
  end

  def show
    @song_list = SongList.not_deleted.find(params[:id])
  end

  def destroy
    song_list = SongList.not_deleted.find(params[:id])
    if song_list.soft_delete
      flash[:notice] = "The worship set was deleted."
    else
      flash[:error] = "There was an error deleting the worship set."      
    end
    redirect_to song_lists_path
  end

  private

  def song_list_params
    params.require(:song_list).permit!
  end
end
