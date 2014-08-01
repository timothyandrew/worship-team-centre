class PlannedRosterGroupDecorator < Draper::Decorator
  delegate_all
  decorates_association :planned_rosters, scope: :chronological_order
end
