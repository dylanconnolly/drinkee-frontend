class IngredientsController < ApplicationController

  def index
    @ingredients = BackEndApi.new.connection
  end
end
