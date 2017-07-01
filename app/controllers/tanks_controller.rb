class TanksController < ApplicationController
  def index
    @tanks = Tank.all
  end

  def show
    @tank = Tank.find(params[:id])
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
    @tank = Tank.find(params[:id])
  end

  def update
    @tank = Tank.find(params[:id])
    if @tank.update(tank_params)
      redirect_to tank_path
    else
      render :edit
    end
  end

  def destroy
    @tank = Tank.find(params[:id])
    @tank.destroy
    redirect_to tank_path
  end

  def new_quantity
    @tank = Tank.find(params[:id])
    new_info = Hash.new
    raise
    new_info[:quantity] = params[:format].to_i
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
