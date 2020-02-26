class BackEndApi
  def connection
    Faraday.new("#{ENV['BACKEND_URL']}") do |f|
    end
  end

  def get_json(uri)
    response = connection.get(uri)

    JSON.parse(response.body, symbolize_names: true)
  end

  def get_ingredients
    ingredient_info = get_json('api/v1/ingredients')

    ingredients = []
    ingredient_info[:data].each do |ingredient_data|
      ingredients.push Ingredient.new(ingredient_data)
    end
    ingredients
  end

  def get_cabinet(user_id)
    cabinet_ingredients_info = get_json("api/v1/#{user_id}/cabinet")
    ingredients = []
    cabinet_ingredients_info[:data].each do |ingredient_data|
      ingredients.push Ingredient.new(ingredient_data)
    end
    ingredients
  end

  def send_ingredients(ingredient_ids_array, user_id)

    json = ingredient_ids_array.to_json

    connection.patch(url = "api/v1/#{user_id}/cabinet", body = json)
  end

  def create_cabinet(user_id)
    connection.post("/api/v1/#{user_id}/cabinet")
  end
end
