class AddColumnServiceToSongLists < ActiveRecord::Migration
  def change
  	add_column :song_lists, :service, :string
  end
end
