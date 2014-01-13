class CreateSongListItems < ActiveRecord::Migration
  def change
    create_table :song_list_items do |t|
      t.references :song_list, index: true
      t.references :song, index: true

      t.timestamps
    end
  end
end
