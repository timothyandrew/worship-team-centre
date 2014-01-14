class AddColumnDeletedAtToSongList < ActiveRecord::Migration
  def change
  	add_column :song_lists, :deleted_at, :date
  end
end
