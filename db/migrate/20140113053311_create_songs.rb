class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :lyrics
      t.integer :song_list_id

      t.timestamps
    end
  end
end
