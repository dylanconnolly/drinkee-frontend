require 'rails_helper'

describe 'user can view their cabinet' do
  it 'and it lists all ingredients they have added' do
    stub_omniauth
    visit '/'
    expect(page).to have_link("Log in with Google")
    click_link "Log in with Google"

    visit '/ingredients'
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
