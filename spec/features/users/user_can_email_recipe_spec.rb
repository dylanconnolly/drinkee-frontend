require 'rails_helper'

RSpec.describe "from a drink show page" do
  it "a user can email a drink recipe" do
    stub_omniauth
    visit '/'
    click_link "Log in with Google"

    visit '/drinks?name=Victor'

    click_link "Email this recipe"
    expect(current_path).to eq('/notifications/Victor/new')

    fill_in :email, with: "bob@gmail.com"
    click_on "Send Recipe"

    expect(current_path).to eq('/results')
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
