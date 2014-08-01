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

  def first_name
    self.name.split.first
  end

  def is_available?(date, service)
    Availability.joins(:availability_group).exists?(date: date, service: service, availability_groups: {user_id: self.id})
  end
end
