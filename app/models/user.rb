class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :team_memberships
  has_many :song_lists, through: :team_memberships
  has_many :leaderships, foreign_key: 'leader_id', class_name: SongList
  has_many :availability_groups

  def all_song_lists_a_part_of
    (song_lists + leaderships).uniq
  end
end
