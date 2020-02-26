class UsersController < ApplicationController
  def show
    @user = current_user
    render file: '/public/404' unless current_user
  end
end
