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

  def resume_add_or_remove
    @activity = Activity.new
    @tank = Tank.find(params[:tank_id])
    @old_info = params[:quantity]
    @intervention = params[:format]
  end

  def resume_transfert
    @activity = Activity.new
    @tank = Tank.find(params[:tank_id])
    @tank_target = Tank.find(params[:tank_target_id])
    @intervention = params[:intervention]
    @old_info_tank = params[:old_info_tank][:quantity]
    @old_info_tank_target = params[:old_info_tank_target][:quantity]

  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to tanks_path
    else
      render "activities#resume"
    end
  end

  def create_activity_transfert
    params = activity_params_transfert
    params_tank = {
      tank_id: params[:tank_id],
      old_quantity: params[:old_quantity_tank].to_i,
      new_quantity: params[:new_quantity_tank].to_i,
      intervention: params[:intervention]
    }

    params_tank_target = {
      tank_id: params[:tank_target_id],
      old_quantity: params[:old_quantity_tank_target].to_i,
      new_quantity: params[:new_quantity_tank_target].to_i,
      intervention: params[:intervention]
    }


    raise
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
      :tank_id,
      :old_quantity,
      :intervention,
      :new_quantity,
      )
  end
  def activity_params_transfert
    params
      .require(:activity)
      .permit(
        :tank_id,
        :old_quantity_tank,
        :new_quantity_tank,
        :intervention,
        :tank_target_id,
        :old_quantity_tank_target,
        :new_quantity_tank_target
      )
  end

end


