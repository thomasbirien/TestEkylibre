class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def resume
    @activity = Activity.new
    @tank = Tank.find(params[:tank_id])
    @old_info = params[:quantity]
    @intervention = params[:format]
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to tanks_path
    else
      raise
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to activity_path
    else
      render :edit
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activity_path
  end

  private
  def activity_params
    params.require(:activity).permit(
      :tank_name,
      :old_quantity,
      :intervention,
      :new_quantity,
      :quantity,
      :quantity_max
      )
  end
end
