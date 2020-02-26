require 'rails_helper'

describe 'user can view their cabinet' do
  it 'and it lists all ingredients they have added' do
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
