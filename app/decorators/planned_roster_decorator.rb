class PlannedRosterDecorator < Draper::Decorator
  delegate_all

  def as_json(options = {})
    {
      date: model.date,
      team: model.team,
      available_users: model.available_users
    }
  end
end
