require 'rails_helper'

describe "as a user on my cabinet show page" do
  it "I see a button to get a list of drinks I can make with the ingredients in my cabinet" do
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

    expect(page).to have_content("Amaretto")
    expect(page).to have_content("Cognac")
    expect(page).to have_content("Baileys Irish Cream")

    click_on "Drinks I Can Make"

    expect(current_path).to eq("/results")
    expect(page).to have_content("ABC")
  end
end
