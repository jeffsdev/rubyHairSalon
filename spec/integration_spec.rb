require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('allows the user to add new stylists to the salon') do
    visit('/')
    click_link('View Stylists')
    click_link('Add A Stylist')
    fill_in('first_name', :with =>'Ashley')
    fill_in('last_name', :with =>'Smith')
    fill_in('phone', :with =>'123')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
  end

end
