class IngredientsController < ApplicationController
  def index
    render json: IngredientsSerializer.new(Ingredient.all)
  end
end
