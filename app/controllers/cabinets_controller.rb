class CabinetsController < ApplicationController
  def show
    render file: '/public/404' unless current_user
    
    @cabinet = BackEndApi.new.get_cabinet(current_user.id)
  end

  def update
    session[:ingredients_array] = params[:ingredients]
    BackEndApi.new.send_ingredients(session[:ingredients_array], current_user.id)
    redirect_to('/cabinet')
  end
end
