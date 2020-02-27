require 'rails_helper'

describe "when a user clicks on a drink from the results page" do
  it "they are taken to that drinks show page" do
    user = create(:user)

    keep_user_logged_in(user)

    visit '/cabinet'

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

    click_on "Update Ingredients"

    click_on "Drinks I Can Make"

    click_on "ABC"

    expect(current_path).to eq('/drinks?name=ABC')
    expect(page).to have_content("ABC")
    # expect(page).to have_content("ABC")
  end
end
