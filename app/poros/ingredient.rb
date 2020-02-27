class Ingredient
  attr_reader :id, :name, :description, :alcohol, :abv
  def initialize(ingredient_data)
    @id = ingredient_data[:attributes][:id]
    @name = ingredient_data[:attributes][:name].capitalize
    @description = ingredient_data[:attributes][:description]
    @alcohol = ingredient_data[:attributes][:alcohol]
    @abv = ingredient_data[:attributes][:abv]
  end
end
