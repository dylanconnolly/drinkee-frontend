class SessionsController < ApplicationController
  def create
    auth_hash = request.env["omniauth.auth"]
    user = User.update_or_create(auth_hash)
    session[:id] = user.id
    create_user_cabinet_on_backend(user)
    redirect_to '/dashboard'
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  private

  def create_user_cabinet_on_backend(user)
    BackEndApi.new.create_cabinet(user.id)
  end
end
