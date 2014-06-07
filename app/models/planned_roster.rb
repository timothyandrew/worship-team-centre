class PlannedRoster < ActiveRecord::Base
  serialize :team
  belongs_to :planned_roster_group, foreign_key: :group_id

  def generate_image
    service = RosterDrawService.new(self)
    service.generate_image
  end

  def leader(type = :morning)
    team[type][:leader]
  end

  def keyboard(type = :morning)
    team[type][:keyboard]
  end

  def powerpoint(type = :morning)
    team[type][:powerpoint]
  end

  def guitar(type = :morning)
    team[type][:guitar]
  end

  def lead_guitar(type = :morning)
    team[type][:lead_guitar]
  end

  def drums(type = :morning)
    team[type][:drums]
  end

  def singing(type = :morning)
    team[type][:singing]
  end
end
