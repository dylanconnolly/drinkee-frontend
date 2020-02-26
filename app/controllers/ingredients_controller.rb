class IngredientsController < ApplicationController

  def index
    @ingredients = BackEndApi.new.connection
    render file: '/public/404' unless current_user
  end
end
