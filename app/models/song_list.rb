class SongList < ActiveRecord::Base
  include SoftDeletable

  has_many :song_list_items, dependent: :destroy
  accepts_nested_attributes_for :song_list_items
  has_many :songs, through: :song_list_items

  belongs_to :leader, class_name: User

  has_many :team_memberships
  accepts_nested_attributes_for :team_memberships
  has_many :team_members, through: :team_memberships, source: :user

  SERVICES = %w(Morning Evening Other)

  validates_inclusion_of :service, in: SERVICES

  def songs_not_in_list
    Song.not_deleted.all - songs.not_deleted
  end

  def users_not_in_team
    User.all - team_members
  end

  def update_clearing_song_list_items_and_team_members(params)
  	song_list_items_attributes = params.delete(:song_list_items_attributes)
    team_memberships_attributes = params.delete(:team_memberships_attributes)
  	transaction do
  	  update!(params)
  	  song_list_items.destroy_all
      team_memberships.destroy_all

      song_list_items_attributes.map(&:last).each do |song_list_item_attrs|
  	  	if song_list_item_attrs.has_key?(:song_id)
  	  		SongListItem.create(song_list_id: self.id, song_id: song_list_item_attrs[:song_id])
  	  	end
      end

      team_memberships_attributes.map(&:last).each do |team_membership_attrs|
        if team_membership_attrs.has_key?(:user_id)
          TeamMembership.create(song_list_id: self.id, user_id: team_membership_attrs[:user_id])
        end
      end
  	end
  end
end
