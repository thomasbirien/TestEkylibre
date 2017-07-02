class TanksController < ApplicationController
  def index
    @tanks = Tank.all
  end

  def show
    @tank = Tank.find(params[:id])
    @tanks = Tank.all.where.not(id: params[:id])
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
    new_info = Hash.new
    new_info[:quantity] = params[:format].to_i
    @tank.update(new_info)
    #redirect to action create of ActivitiesController
    redirect_to tank_path(@tank)
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
