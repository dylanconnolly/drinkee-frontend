class BackEndApi
  def connection
    response = Faraday.get('http://localhost:9393/ingredients')

    ingredient_info = JSON.parse(response.body, symbolize_names: true)
    binding.pry

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
