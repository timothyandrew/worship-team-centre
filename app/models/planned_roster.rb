class PlannedRoster < ActiveRecord::Base
  serialize :team
  belongs_to :planned_roster_group, foreign_key: :group_id

  def generate_image
    service = RosterDrawService.new(self)
    service.generate_image
  end

  def leader(type = :morning)
    team[type][:leader].presence || "?"
  end

  def keyboard(type = :morning)
    team[type][:keyboard].presence || "?"
  end

  def powerpoint(type = :morning)
    team[type][:powerpoint].presence || "?"
  end

  def guitar(type = :morning)
    team[type][:guitar].presence || "?"
  end

  def bass(type = :morning)
    team[type][:bass].presence || "?"
  end

  def drums(type = :morning)
    team[type][:drums].presence || "?"
  end

  def singing(type = :morning)
    team[type][:singing].presence || "?"
  end

  def available_users
    {
      morning: User.joins(availability_groups: :availabilities).where(availabilities: {service: "Morning"}).where(availabilities: {date: self.date}),
      evening: User.joins(availability_groups: :availabilities).where(availabilities: {service: "Evening"}).where(availabilities: {date: self.date})
    }
  end
end
