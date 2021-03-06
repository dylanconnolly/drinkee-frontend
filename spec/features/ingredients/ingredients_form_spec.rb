require 'rails_helper'

RSpec.describe 'Ingredients Form', type: :feature do
  it 'user can check ingredients and they can persist' do
    user = create(:user)

    keep_user_logged_in(user)

    visit('/ingredients')
    within '#ingredient-1' do
      check('ingredients[]')
    end
    click_on('Update Ingredients')
    expect(current_path).to eq('/cabinet')

    visit('/ingredients')

    within '#ingredient-1' do
      expect(page).to have_field('ingredients[]', checked: true)
    end
  end
end
