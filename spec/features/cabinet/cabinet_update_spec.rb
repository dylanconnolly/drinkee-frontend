require 'rails_helper'

describe 'when a user has selected some ingredients' do
  it 'and they click update ingredients, a patch request is sent to the backend' do

    user = create(:user)

    keep_user_logged_in(user)

    stub_request(:post, "http://localhost:9393/api/v1/#{user.id}/cabinet").
    with(body: '').
    to_return(status: 200, body: '')

    Faraday.new.post("#{ENV['BACKEND_URL']}api/v1/#{user.id}/cabinet")

    json_response = File.read('spec/fixtures/ingredients.json')
    stub_request(:get, 'http://localhost:9393/api/v1/ingredients').
    to_return(status: 200, body: json_response)

    visit '/ingredients'

    within '#ingredient-1' do
      check('ingredients[]')
    end

    within '#ingredient-2' do
      check('ingredients[]')
    end

    update_ingredient_response = File.read('spec/fixtures/ingredient_return.json')
    stub_request(:patch, "http://localhost:9393/api/v1/#{user.id}/cabinet").
    with(body: "[\"1\",\"2\"]").
    to_return(status:200, body: update_ingredient_response)

    cabinet_response = File.read('spec/fixtures/cabinet.json')
    stub_request(:get, "http://localhost:9393/api/v1/#{user.id}/cabinet").
    to_return(status: 200, body: cabinet_response)

    click_on "Update Ingredients"

    expect(page).to have_content("Vodka")
    expect(page).to have_content("Gin")
  end
end
