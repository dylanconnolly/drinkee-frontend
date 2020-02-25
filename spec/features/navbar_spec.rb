require 'rails_helper'

RSpec.describe "user has a navbar" do
  it "and can see the following links:
  - Dashboard
  - Cabinet
  - Ingredients
  - Find Recipes
  - Log out" do

    stub_omniauth
    visit '/'
    expect(page).to have_link("Log in with Google")
    click_link "Log in with Google"
    expect(current_path).to eq('/dashboard')

    within '.navbar' do
      expect(page).to have_link("Dashboard")
      expect(page).to have_link("Cabinet")
      expect(page).to have_link("Ingredients")
      expect(page).to have_link("Find Recipes")
      expect(page).to have_link("Log out")
    end

    within '.navbar' do
      click_link "Dashboard"
    end
    expect(current_path).to eq('/dashboard')

    within '.navbar' do
      click_link "Cabinet"
    end
    expect(current_path).to eq('/cabinet')

    within '.navbar' do
      click_link "Ingredients"
    end
    expect(current_path).to eq('/ingredients')

    within '.navbar' do
      click_link "Find Recipes"
    end
    expect(current_path).to eq('/results')

    within '.navbar' do
      click_link "Log out"
    end
    expect(current_path).to eq('/')
    expect(page).to_not have_content("Logged in as Rachel Lew")
    expect(page).to have_content("Log in")
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
