class BackEndApi
  def connection
    response = Faraday.get('http://localhost:9393/ingredients')

    ingredient_info = JSON.parse(response.body, symbolize_names: true)
    ingredients  = []
    (ingredient_info)[:data].each do |ingredient_data|

      ingredients.push Ingredient.new(ingredient_data)

    end
    ingredients
  end
end


# class OpenLibraryApi
#
#   def connection
#     response = Faraday.get('http://openlibrary.org/search.json?title=the+man+who+saw+everything')
#
#     book_info = JSON.parse(response.body, symbolize_names: true)[:docs].first
#     Book.new(book_info)
#   end
# end
