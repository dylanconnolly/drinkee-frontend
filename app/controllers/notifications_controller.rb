class NotificationsController < ApplicationController
  def new
    @drink_name = params[:drink_name]
  end

  def create
    drink_name = params[:drink_name]
    drink = BackEndApi.new.get_drink(drink_name)

    FriendNotifierMailer.inform(current_user, drink, params[:email]).deliver_now
    redirect_to results_url
  end
end
