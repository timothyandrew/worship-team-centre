class Song < ActiveRecord::Base
  has_many :song_list_items
  has_many :songs, through: :song_list_items
end
