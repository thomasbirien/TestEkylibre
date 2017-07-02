class Add
  attr_reader :params, :tanks

  def initialize(params)
    @params = params
    @tank = Tank.find(@params[:tank][:id])
  end

  def added_quantity
    if checked <= @tank.quantity_max
      checked
    else
      false
    end
  end

  def checked
   quantity_check = @tank.quantity + @params[:tank][:quantity_change].to_i
  end
end
