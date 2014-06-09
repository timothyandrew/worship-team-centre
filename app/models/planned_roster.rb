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

  def lead_guitar(type = :morning)
    team[type][:lead_guitar].presence || "?"
  end

  def drums(type = :morning)
    team[type][:drums].presence || "?"
  end

  def singing(type = :morning)
    team[type][:singing].presence || "?"
  end
end
