require 'rails_helper'

RSpec.describe 'API consumption', type: :model do
  it 'consumes our back_end api for data' do
    visit('/')
  end
end



# require 'rails_helper'
#
# RSpec.describe 'api search', type: :feature do
#   it 'does the thing' do
#     visit('/')
#     # binding.pry
#
#     # fill_in 'Enter Book Title', with: 'the man who saw everything'
#     fill_in :title, with: 'the man who saw everything'
#     click_on('Find Book')
#     # save_and_open_page
#     expect(current_path).to eq(search_path)
#
#     expect(page).to have_content('The Man Who Saw Everything')
#     #test css
#     expect(page).to have_content('The Man Who Saw Everything,” which was longlisted for the Booker Prize, looks at masculinity through the perspective of a young historian who sneers at “authoritarian old men.')
#     expect(page).to have_content('Deborah Levy’s latest novel, “The Man Who Saw Everything,” experiments with time travel, history and the endless complications of love.')
#   end
#
# end
