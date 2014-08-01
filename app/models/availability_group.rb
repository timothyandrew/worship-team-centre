class AvailabilityGroup < ActiveRecord::Base
  has_many :availabilities
  belongs_to :user

  validates_uniqueness_of :month, scope: :user_id

  def save_with_availabilities(availabilities_params)
    availabilities_params ||= []

    transaction do
      save!
      availabilities.destroy_all

      self.availabilities = []
      availabilities_params.each do |_, hash|
        hash.each do |service, hash|
          availability = Availability.new(service: service.titleize)
          hash.each do |date, _|
            availability.date = date
          end
          self.availabilities << availability
        end
      end

      save!
      true
    end
  rescue ActiveRecord::RecordInvalid
    false
  end
end
