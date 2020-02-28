require 'rails_helper'

RSpec.describe 'only users are authorized to visit certain pages' do
  xit "visitors do not have access to those pages and receive a 404" do
    visit '/'

    visit '/dashboard'
    expect(page).to have_content("The page you were looking for doesn't exist (404)")

    visit '/cabinet'
    expect(page).to have_content("The page you were looking for doesn't exist (404)")

    visit '/ingredients'
    expect(page).to have_content("The page you were looking for doesn't exist (404)")

    visit '/results'
    expect(page).to have_content("The page you were looking for doesn't exist (404)")

    within '.navbar' do
      expect(page).to_not have_link("Log out")
    end
  end
end
