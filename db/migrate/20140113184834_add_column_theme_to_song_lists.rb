class AddColumnThemeToSongLists < ActiveRecord::Migration
  def change
  	add_column :song_lists, :theme, :string
  end
end
