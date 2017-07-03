class TanksController < ApplicationController
  def index
    @tanks = Tank.all
    @tanks = @tanks.order(:id)
  end

  def show
    @tank = Tank.find(params[:id])
    @tanks = Tank.all.where.not(id: params[:id])
    @tank_name_array = []
    @tanks.each {|tank| @tank_name_array << tank.tank_name}
  end

  def new
    @tank = Tank.new
  end

  def create
    @tank = Tank.new(tank_params)
    if @tank.save
      redirect_to tank_path
    else
      render :new
    end
  end

  def edit
    if params[:format] == nil
      @tank = Tank.find(params[:id])
    elsif params[:format].split('/').count == 2
      @tank = Tank.find(params[:id].split('/').first)
      @tank_target = Tank.find(params[:id].split('/').last)
      update_quantity_both
    else
      @tank = Tank.find(params[:id])
      update_quantity
    end
  end

  def update
    @tank = Tank.find(params[:id])
    if @tank.update(tank_params)
      redirect_to tank_path
    else
      render :edit
    end
  end

  def update_quantity
    old_info = Hash.new
    old_info[:quantity] = @tank.quantity
    new_info = Hash.new
    new_info[:quantity] = params[:format].to_i
    raise
    if @tank.quantity > new_info[:quantity]
      @tank.update(new_info)
      redirect_to tank_activities_path(@tank, "soustraction de vin")
    else
      redirect_to tank_activities_path(@tank, "ajout de vin")
    end

    @tank.update(new_info)
    #redirect to action create of ActivitiesController
    redirect_to tank_path(@tank)
  end

  def update_quantity_both
    new_info_tank = Hash.new
    new_info_tank[:quantity] = params[:format].split('/').first.to_i

    new_info_tank_target = Hash.new
    new_info_tank_target[:quantity] = params[:format].split('/').last.to_i

    @tank.update(new_info_tank)
    @tank_target.update(new_info_tank_target)
    redirect_to tanks_path

  end

  def destroy
    @tank = Tank.find(params[:id])
    @tank.destroy
    redirect_to tank_path
  end

  private
  def tank_params
    params.require(:tank).permit(
      :tank_name,
      :quantity,
      :quantity_max
      )
  end
end
