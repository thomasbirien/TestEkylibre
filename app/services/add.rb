class Add
  attr_accessor :params, :tanks

  def initialize(params)
    @params = params
  end

  def added_quantity
    @tank = Tank.find(@params[:tank][:id])
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
