class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_ingredients_id

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def current_ingredients_id
    session[:ingredients_array] ||= []
  end
end
