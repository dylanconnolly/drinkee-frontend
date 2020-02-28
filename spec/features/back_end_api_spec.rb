require 'rails_helper'

RSpec.describe 'API consumption', type: :feature do
  it 'consumes our back_end api for data' do
    json_response = File.read('spec/fixtures/ingredients.json')
    stub_request(:get, 'http://localhost:9393/api/v1/ingredients').
    to_return(status: 200, body: json_response)
    
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit('/ingredients')
    expect(page).to have_content('Vodka')
  end
end
