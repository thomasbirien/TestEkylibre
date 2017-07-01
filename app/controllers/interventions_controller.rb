class InterventionsController < ApplicationController
  def add
    @tank = Tank.find(params[:tank][:id])
    if checked < @tank.quantity_max
      redirect_to edit_tank_path(@tank, checked)
    end

    Add.new(params)
  end

  def remove
    Less.new
  end

  def traitement
    #raise
  end

  def transfert
    #check the value
    Remove.new(params)
    Add.new(params)
  end

  private
  def checked
   quantity_check = @tank.quantity + params[:tank][:quantity].to_i
  end

end
