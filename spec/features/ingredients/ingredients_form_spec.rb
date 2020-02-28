require 'rails_helper'

RSpec.describe 'Ingredients Form', type: :feature do
  it 'user can check ingredients and they can persist' do
    json_response = File.read('spec/fixtures/ingredients.json')
    stub_request(:get, 'http://localhost:9393/api/v1/ingredients').
    to_return(status: 200, body: json_response)
    user = create(:user)

    keep_user_logged_in(user)

    visit('/ingredients')

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

    click_on('Update Ingredients')

    expect(current_path).to eq('/cabinet')

    visit('/ingredients')

    within '#ingredient-1' do
      expect(page).to have_field('ingredients[]', checked: true)
    end
  end
end
