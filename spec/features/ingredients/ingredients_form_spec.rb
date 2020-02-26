require 'rails_helper'

RSpec.describe 'Ingredients Form', type: :feature do
  it 'user can check ingredients and they can persist' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

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
