class PlannedRosterGroupDecorator < Draper::Decorator
  delegate_all
  decorates_association :planned_rosters
end
