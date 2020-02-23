class SessionsController < ApplicationController
  def create
    auth_hash = request.env["omniauth.auth"]
    user = User.update_or_create(auth_hash)
    session[:id] = user.id
    redirect_to '/dashboard'
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
