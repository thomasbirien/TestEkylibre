class Transfert
  attr_reader

  def initialize(params)
    @params = params
    @tank = Tank.find(params[:tank][:id])
    tank_target_active_record = Tank.where("tank_name = ?", params[:tank][:tank_name])
    tank_target_array = Tank.find(tank_target_active_record.ids)
    @tank_target = tank_target_array[0]


  end

  def transfert
    if checked
      checked
    else
      false
    end
  end

  private

  def checked
    quantity_remove_tank = @tank.quantity - @params[:tank][:quantity_change].to_i
    quantity_added_tank_target = @tank_target.quantity + @params[:tank][:quantity_change].to_i
    if (quantity_remove_tank >= 0) && (quantity_added_tank_target <= @tank.quantity_max)
      return quantity_remove_tank, quantity_added_tank_target
    else
      false
    end
  end
end
