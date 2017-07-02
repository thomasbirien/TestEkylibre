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
  end

  def remove
    remove = Less.new(params)
    result = remove.remove_quantity
    tank = Tank.find(params[:tank][:id])
    if result.class == Fixnum
      redirect_to edit_tank_path(tank, result)
    else
      flash[:notice] = "impossible d'enlevé en dessous de 0L"
      redirect_to tank_path(tank)
    end
  end

  def traitement
    #raise
  end

  def transfert
    transfert = Transfert.new(params)
    result = transfert.transfert
    tank = Tank.find(params[:tank][:id])
    tank_target_active_record = Tank.where("tank_name = ?", params[:tank][:tank_name])
    tank_target_array = Tank.find(tank_target_active_record.ids)
    tank_target = tank_target_array[0]

    array_result = []
    array_result << tank
    array_result << tank_target

    redirect_to edit_tank_path(array_result, result)
  end
end
