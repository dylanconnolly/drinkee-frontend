class DrinksController < ApplicationController

  def show
    @drink = BackEndApi.new.get_drink(params[:name])
  end
end
