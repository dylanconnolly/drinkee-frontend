class CabinetsController < ApplicationController
  def show

  end

  def update
    session[:ingredients_array] = params[:ingredients]
    BackEndApi.new.send_ingredients(session[:ingredients_array], current_user.id)
    redirect_to('/cabinet')
  end
end
