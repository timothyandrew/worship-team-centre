class SongList < ActiveRecord::Base
  include SoftDeletable

  has_many :song_list_items, dependent: :destroy
  has_many :songs, through: :song_list_items
  accepts_nested_attributes_for :song_list_items


  SERVICES = %w(Morning Evening Other)

  validates_inclusion_of :service, in: SERVICES

  def songs_not_in_list
    Song.not_deleted.all - songs.not_deleted
  end

  def update_clearing_song_list_items(params)
  	song_list_items_attributes = params.delete(:song_list_items_attributes)
  	transaction do
  	  update!(params)
  	  song_list_items.destroy_all
  	  song_list_items_attributes.map(&:last).each do |song_list_item_attrs|
  	  	if song_list_item_attrs.has_key?(:song_id)
  	  		SongListItem.create(song_list_id: self.id, song_id: song_list_item_attrs[:song_id])
  	  	end
  	  end
  	end
  end
end
