class AvailabilitySummariesController < ApplicationController
  def index
    @months = AvailabilityGroup.order(month: :desc).pluck(:month).uniq
  end

  def show
    @sundays = sundays_in_month(Date.parse(params[:id]))
  end

  private

  def sundays_in_month(date)
    days = (date.beginning_of_month..date.end_of_month).to_a
    days.select(&:sunday?)
  end
end
