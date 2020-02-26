class CabinetsController < ApplicationController
  def show
    render file: '/public/404' unless current_user
  end

  def update
    session[:ingredients_array] = params[:ingredients]
    redirect_to('/cabinet')
  end
end
