class NotificationsController < ApplicationController
  def new

  end
  
  def create
    FriendNotifierMailer.inform(current_user, params[:email]).deliver_now
    flash[:notice] = "Successfully emailed this recipe!"
    redirect_to '/dashboard'
    # change this redirect back to the drink show page
  end
end
