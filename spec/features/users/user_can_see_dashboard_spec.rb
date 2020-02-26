require 'rails_helper'

RSpec.describe "user can see dashboard when logged in" do
  it "and see the following:
  - Google name (first and last name)
  - Email
  - link to my cabinet" do

    stub_omniauth
    visit '/'
    expect(page).to have_link("Log in with Google")
    click_link "Log in with Google"
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Name: Rachel Lew")
    expect(page).to have_content("Email: rlew07@gmail.com")
    click_link "My Cabinet"
    expect(current_path).to eq('/cabinet')
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
