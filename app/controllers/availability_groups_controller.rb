class AvailabilityGroupsController < ApplicationController
  def new
    @availability_group = AvailabilityGroup.new
  end

  def create
    @availability_group = AvailabilityGroup.new(availability_group_params)
    @availability_group.user = current_user
    if @availability_group.save_with_availabilities(params[:availabilities])
      redirect_to root_path, notice: "Your availability was saved!"
    else
      render :new
    end
  end
  
  private

  def availability_group_params
    params.require(:availability_group).permit(:month)
  end
end
