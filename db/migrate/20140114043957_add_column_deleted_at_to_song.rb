class AddColumnDeletedAtToSong < ActiveRecord::Migration
  def change
  	add_column :songs, :deleted_at, :date
  end
end
