require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using google oauth 2" do
    stub_omniauth
    visit '/'
    expect(page).to have_link("Log in with Google")
    click_link "Log in with Google"
    expect(page).to have_content("Logged in as rlew07@gmail.com")
    expect(page).to have_link("Log out")
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

# describe "user can login with their gmail" do
#   it "by clicking a button that connects to Google" do
#     OmniAuth.config.test_mode = true
#
#     user = create(:user)
#
#     OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
#       :provider => 'google_oauth2',
#       :credentials => {:token => ENV['GITHUB_TOKEN']}
#       })
#
#     visit '/'
#     expect(page).to have_link("Log In")
#
#     expect(page).to_not have_link("Dashboard")
#     expect(page).to_not have_link("Cabinet")
#     expect(page).to_not have_link("Ingredients")
#     expect(page).to_not have_link("Find Recipes")
#
#     click_link "Log In"
#
#     expect(current_path).to eq('/dashboard')
#     OmniAuth.config.mock_auth[:google_oauth2] = nil
#   end
# end
