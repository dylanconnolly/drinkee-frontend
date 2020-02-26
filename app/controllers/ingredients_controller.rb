class IngredientsController < ApplicationController

  def index
    conn = BackEndApi.new

    @ingredients = conn.get_ingredients
  end
end
