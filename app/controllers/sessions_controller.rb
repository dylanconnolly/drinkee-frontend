class SessionsController < ApplicationController
  def create
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    session[:id] = user.id
    user.token = access_token.credentials.token
    refresh_token = access_token.credentials.refresh_token
    user.refresh_token = refresh_token if refresh_token.present?
    user.save
    redirect_to '/dashboard'
  end
end
