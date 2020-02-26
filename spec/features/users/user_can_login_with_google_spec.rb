require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using google oauth 2" do
    stub_omniauth
    visit '/'
    expect(page).to have_link("Log in with Google")
    click_link "Log in with Google"
    expect(page).to have_content("Logged in as Rachel Lew")
    expect(page).to have_link("Log out")
    click_link "Log out"
    expect(page).to_not have_content("Log out")
    expect(page).to_not have_content("Logged in as Rachel Lew")
    expect(page).to have_content("Log in with Google")
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
