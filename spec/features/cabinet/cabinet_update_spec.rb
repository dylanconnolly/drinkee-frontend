require 'rails_helper'

describe 'when a user has selected some ingredients' do
  it 'and they click update ingredients, a patch request is sent to the backend' do

    user = create(:user)

    keep_user_logged_in(user)

    visit '/ingredients'

    within '#ingredient-1' do
      check('ingredients[]')
    end

    within '#ingredient-2' do
      check('ingredients[]')
    end

    click_on "Update Ingredients"

    expect(current_page).to have_content("Vodka")
    expect(current_page).to have_content("Gin")
  end
end
