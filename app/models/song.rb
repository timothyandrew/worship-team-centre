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
    latest_song_list = song_lists.order(:done_on).last
    latest_song_list.done_on if latest_song_list
  end
end
