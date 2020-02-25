class UsersController < ApplicationController
  def show
    @user = User.where(id: current_user.id).first
  end
end
