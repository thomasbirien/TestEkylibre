class InterventionsController < ApplicationController
  def add
    #check validation
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
end
