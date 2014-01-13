class ChangeColumnSongLyricsToText < ActiveRecord::Migration
  def change
    change_column :songs, :lyrics, :text
  end
end
