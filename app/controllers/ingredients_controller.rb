class IngredientsController < ApplicationController

  def index
    # @ingredients = BackEndApi.new.connection
    render file: '/public/404' unless current_user
    conn = BackEndApi.new
    @ingredients = conn.get_ingredients
  end
end
