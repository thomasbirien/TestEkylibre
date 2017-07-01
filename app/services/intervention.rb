class Intervention
  attr_reader :params, :tanks

  def initialize(params)
    @intervention = params[:intervention]
    @params = params
  end

  def type_intervention
    case @intervention
    when add
      wine = Add.new(@params)
      @wine_added = wine.add_wine
      #call method update controller tanks
    when less
      wine = Less.new(@params)
      @wine_less = wine.less_wine
      #call method update controlelr tanks
    when traitement
    when transfert
  end
end
