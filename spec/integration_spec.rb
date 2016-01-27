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

describe('deleting a stylist', {:type => :feature}) do
  it('allows the user to delete stylists from the salon') do
    visit('/stylists')
    click_link('Add A Stylist')
    fill_in('first_name', :with =>'Ashley')
    fill_in('last_name', :with =>'Smith')
    fill_in('phone', :with =>'123')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
    click_link("Back")
    click_link('View Stylists')
    click_link('Ashley Smith')
    click_button('Delete Stylist')
    expect(page).to have_content('There are no stylists yet!')
  end
end

describe('updating a stylist', {:type => :feature}) do
  it('allows the user to update stylist info') do
    visit('/stylists')
    click_link('Add A Stylist')
    fill_in('first_name', :with =>'Ashley')
    fill_in('last_name', :with =>'Smith')
    fill_in('phone', :with =>'123')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
    click_link("Back")
    click_link('View Stylists')
    click_link('Ashley Smith')
    click_link('Update Stylist Information')
    fill_in('first_name', :with =>'Ashley')
    fill_in('last_name', :with =>'Roberts')
    fill_in('phone', :with =>'123')
    click_button('Update Stylist')
    expect(page).to have_content('Success!')
    click_link("Back")
    click_link('View Stylists')
    expect(page).to have_content('Ashley Roberts')
  end
end

describe('adding client to a stylist', {:type => :feature}) do
  it('allows the user to add a client and tie it to a stylist') do
    visit('/stylists')
    click_link('Add A Stylist')
    fill_in('first_name', :with =>'Ashley')
    fill_in('last_name', :with =>'Smith')
    fill_in('phone', :with =>'123')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
    click_link("Back")
    click_link('View Stylists')
    click_link('Ashley Smith')
    click_link('Add Client')
    fill_in('first_name', :with =>'Sarah')
    fill_in('last_name', :with =>'Jones')
    fill_in('phone', :with =>'445')
    select "Ashley Smith", :from => "stylist_id"
    click_button('Add Client')
    expect(page).to have_content('Success!')
    click_link("Back")
    click_link('View Stylists')
    click_link('Ashley Smith')
    expect(page).to have_content('Sarah Jones')
  end
end
