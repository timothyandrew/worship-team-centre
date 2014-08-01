class Availability < ActiveRecord::Base
  belongs_to :availability_group

  SERVICES = %w(Morning Evening Other)

  validates_inclusion_of :service, in: SERVICES
end
