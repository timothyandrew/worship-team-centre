# encoding: utf-8

class Song < ActiveRecord::Base
  has_many :song_list_items
  has_many :songs, through: :song_list_items

  KEYS = %w(C C♯ D E♭ E F F♯ G A♭ A B♭ B)

  validates_inclusion_of :key, in: KEYS
end
