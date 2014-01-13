class SongList < ActiveRecord::Base
  has_many :song_list_items
  has_many :songs, through: :song_list_items
  accepts_nested_attributes_for :song_list_items
end
