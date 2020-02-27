require 'rails_helper'

describe "when a user clicks on a drink from the results page" do
  it "they are taken to that drinks show page" do
    stub_omniauth
    visit '/'
    click_link "Log in with Google"

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
    expect(current_path).to eq('/results')

    within "#French-Connection" do
      expect(page).to have_link "View"
    end
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
