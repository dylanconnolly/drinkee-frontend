require 'rails_helper'

describe "as a user on my cabinet show page" do
  it "I see a button to get a list of drinks I can make with the ingredients in my cabinet" do
    stub_omniauth
    visit '/'
    click_link "Log in with Google"

    visit '/cabinet'

    visit '/ingredients'

    within '#ingredient-18' do
      check('ingredients[]')
    end

    within '#ingredient-118' do
      check('ingredients[]')
    end

    within '#ingredient-40' do
      check('ingredients[]')
    end

    click_on "Update Ingredients"

    expect(page).to have_content("Amaretto")
    expect(page).to have_content("Cognac")
    expect(page).to have_content("Baileys irish cream")

    click_on "Drinks I Can Make"

    expect(current_path).to eq("/results")
    expect(page).to have_content("ABC")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: "google",
      uid: "12345678910",
      info: {
        email: "rlew07@gmail.com",
        first_name: "Rachel",
        last_name: "Lew"
      },
      credentials: {
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        expires_at: DateTime.now
      }
    })
  end
end
