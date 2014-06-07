class PlannedRosterGroup < ActiveRecord::Base
  has_many :planned_rosters, foreign_key: :group_id

  accepts_nested_attributes_for :planned_rosters
end
