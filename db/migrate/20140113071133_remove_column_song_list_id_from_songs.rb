class RemoveColumnSongListIdFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :song_list_id, :integer
  end
end
