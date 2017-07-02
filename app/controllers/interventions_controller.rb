class InterventionsController < ApplicationController
  def add
    add = Add.new(params)
    result = add.added_quantity
    tank = Tank.find(params[:tank][:id])
    if result.class == Fixnum
      redirect_to edit_tank_path(tank, result)
    else
      flash[:notice] = "impossible la quantité maximum est dépassée !"
      redirect_to tank_path(tank)
    end
    # @tank = Tank.find(params[:tank][:id])
    # if checked < @tank.quantity_max
    #   redirect_to edit_tank_path(@tank, checked)
    # else
    #   flash[:notice] = "impossible la quantité maximum est dépassée !"
    #   redirect_to tank_path(@tank)
    # end
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

end
