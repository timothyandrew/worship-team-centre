# encoding: utf-8

class Song < ActiveRecord::Base
  include SoftDeletable

  has_many :song_list_items, dependent: :destroy
  has_many :song_lists, through: :song_list_items

  KEYS = %w(C C♯ D E♭ E F F♯ G A♭ A B♭ B)

  validates_inclusion_of :key, in: KEYS

  def name_with_key
  	if key
  	  "#{name} (#{key})"
  	else
  		name
  	end
  end

  def last_done_on
    latest_song_list = SongList.joins(:song_list_items).where(song_list_items: {song_id: self.id} ).order(:done_on).last
    latest_song_list.done_on if latest_song_list
  end

  def self.apply_ordering(key, order)
    key = key.presence || "created_at"
    order = order == "asc" ? "asc" : "desc"

    if key == "done_on"
      order_by_last_done_on(order)
    else
      order(key => order.to_sym)
    end
  end

  def self.order_by_last_done_on(order)
    scope = joins("LEFT OUTER JOIN song_list_items ON song_list_items.song_id = songs.id LEFT OUTER JOIN song_lists ON song_lists.id = song_list_items.song_list_id")
    scope = scope.select("DISTINCT ON (songs.id) song_lists.done_on, songs.*").order("songs.id, song_lists.done_on DESC")

    nulls = order == "asc" ? "NULLS FIRST" : "NULLS LAST"
    Song.find_by_sql("SELECT * FROM (#{scope.to_sql}) AS songs ORDER BY done_on #{order} #{nulls}")
  end
end
