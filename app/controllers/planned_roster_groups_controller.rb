class PlannedRosterGroupsController < ApplicationController
  def new
    @planned_roster_group = PlannedRosterGroup.new(month: Date.today)
  end

  def edit
    @planned_roster_group = PlannedRosterGroup.find(params[:id])
  end

  def show
    @planned_roster_group = PlannedRosterGroup.find(params[:id])
  end

  def create
    @planned_roster_group = PlannedRosterGroup.new(planned_roster_group_params)
    if create_roster_group_with_rosters
      redirect_to planned_roster_group_path(@planned_roster_group)
    else
      render :new
    end
  end

  def update
    @planned_roster_group = PlannedRosterGroup.find(params[:id])
    if update_roster_group_with_rosters
      redirect_to planned_roster_group_path(@planned_roster_group)
    else
      render :edit
    end
  end

  def index
    @planned_roster_groups = PlannedRosterGroup.all.order(month: :desc)
  end

  def download_package
    @planned_roster_group = PlannedRosterGroup.find(params[:id])
    send_data(@planned_roster_group.generate_images, :type => 'application/zip', :filename => "#{SecureRandom.hex}.zip")
  end

  private

  def create_roster_group_with_rosters
    PlannedRosterGroup.transaction do
      @planned_roster_group.save!
      @planned_roster_group.planned_rosters.destroy_all
      params[:planned_rosters].each do |i, pr|
        PlannedRoster.create!(team: pr[:team], date: pr[:date], planned_roster_group: @planned_roster_group)
      end
      @planned_roster_group
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  def update_roster_group_with_rosters
    PlannedRosterGroup.transaction do
      Rails.logger.fatal planned_roster_group_params
      @planned_roster_group.update_attributes!(planned_roster_group_params)
      @planned_roster_group.planned_rosters.destroy_all
      params[:planned_rosters].each do |i, pr|
        PlannedRoster.create!(team: pr[:team], date: pr[:date], planned_roster_group: @planned_roster_group)
      end
      @planned_roster_group
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  def planned_roster_group_params
    params.require(:planned_roster_group).permit(:month)
  end
end
