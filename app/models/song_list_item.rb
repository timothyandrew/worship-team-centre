class SongListItem < ActiveRecord::Base
  belongs_to :song_list
  belongs_to :song
end
