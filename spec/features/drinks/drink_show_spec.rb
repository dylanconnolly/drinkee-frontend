require 'rails_helper'

describe "when a user clicks on a drink from the results page" do
  it "they are taken to that drinks show page" do
    user = create(:user)

    keep_user_logged_in(user)

    cabinet_response = File.read('spec/fixtures/cabinet.json')
    stub_request(:get, "http://localhost:9393/api/v1/#{user.id}/cabinet").
    to_return(status: 200, body: cabinet_response)

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

    update_ingredient_response = File.read('spec/fixtures/ingredient_return.json')
    stub_request(:patch, "http://localhost:9393/api/v1/#{user.id}/cabinet").
    with(body: "[\"18\",\"118\",\"223\"]").
    to_return(status:200, body: update_ingredient_response)

    click_on "Update Ingredients"

    drinks_response = File.read('spec/fixtures/drink_return.json')
    stub_request(:get, "http://localhost:9393/api/v1/#{user.id}/results").
    to_return(status:200, body: drinks_response)

    click_on "Drinks I Can Make"

    single_drink = File.read('spec/fixtures/single_drink.json')
    stub_request(:get, "http://localhost:9393/api/v1/drinks?name=ABC").
    to_return(status: 200, body: single_drink)

    click_on "ABC"

    expect(current_path).to eq('/drinks')
    expect(page).to have_content("ABC")
  end
end
