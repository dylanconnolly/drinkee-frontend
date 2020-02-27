require 'rails_helper'

describe 'user can view their cabinet' do
  it 'and it lists all ingredients they have added' do
    user = create(:user)

    keep_user_logged_in(user)

    visit '/ingredients'
    save_and_open_page
    within '#ingredient-1' do
      check('ingredients[]')
    end

    within '#ingredient-2' do
      check('ingredients[]')
    end

    click_on "Update Ingredients"

    expect(page).to have_content("Vodka")
    expect(page).to have_content("Gin")
  end
end
