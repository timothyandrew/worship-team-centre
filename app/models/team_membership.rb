class TeamMembership < ActiveRecord::Base
  belongs_to :song_list
  belongs_to :user
end
