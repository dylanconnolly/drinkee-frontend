class CabinetsController < ApplicationController
  def show

  end

  def update
    session[:ingredients_array] = params[:ingredients]
    redirect_to('/cabinet')
  end
end
