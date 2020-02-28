require 'rails_helper'

describe "as a user on my cabinet show page" do
  xit "I see a button to get a list of drinks I can make with the ingredients in my cabinet" do
    user = create(:user, id: 1)

    keep_user_logged_in(user)

    empty_cabinet = File.read('spec/fixtures/empty_cabinet.json')
    stub_request(:get, "http://localhost:9393/api/v1/#{user.id}/cabinet").
      to_return(status: 200, body: empty_cabinet)

    visit '/cabinet'

    json_response = File.read('spec/fixtures/ingredients.json')
    stub_request(:get, 'http://localhost:9393/api/v1/ingredients').
    to_return(status: 200, body: json_response)

    visit '/ingredients'

    within '#ingredient-18' do
      check('ingredients[]')
    end

    within '#ingredient-118' do
      check('ingredients[]')
    end

    within '#ingredient-223' do
      check('ingredients[]')
    end


    update_ingredient_response = File.read('spec/fixtures/update_ingredient_response_2.json')
    stub_request(:patch, "http://localhost:9393/api/v1/#{user.id}/cabinet").
    with(body: "[\"18\",\"118\",\"223\"]").
    to_return(status:200, body: update_ingredient_response)

    click_on "Update Ingredients"

    expect(page).to have_content("Amaretto")
    expect(page).to have_content("Cognac")
    expect(page).to have_content("Baileys Irish Cream")

    click_on "Drinks I Can Make"

    expect(current_path).to eq("/results")
    expect(page).to have_content("ABC")
  end
end
