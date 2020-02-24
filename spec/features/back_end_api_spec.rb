require 'rails_helper'

RSpec.describe 'API consumption', type: :model do
  it 'consumes our back_end api for data' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit('/ingredients')
    expect(page).to have_content('Vodka')
  end
end
