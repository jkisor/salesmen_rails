require 'spec_helper'

feature 'updating a location' do
  background { @location = create :location}
  
  scenario 'changing name' do
    new_name = 'The New Name'

    visit locations_path
    click_link @location.name
    click_link 'Edit'
    fill_in 'Name', with: new_name
    click_button 'Save'

    expect(page).to have_text new_name
    expect(page).to have_text 'Location successfully updated.'
  end

  scenario 'changing address' do
    new_addr_1 = '987 1st Street'
    new_addr_2 = '#104'

    visit locations_path
    click_link @location.name
    click_link 'Edit'
    fill_in 'Address line 1', with: new_addr_1
    fill_in 'Address line 2', with: new_addr_2

    click_button 'Save'

    expect(page).to have_text new_addr_1
    expect(page).to have_text new_addr_2
  end

  scenario 'changing city' do
    new_city = 'San Francisco'

    visit locations_path
    click_link @location.name
    click_link 'Edit'
    fill_in 'City', with: new_city
    click_button 'Save'

    expect(page).to have_text new_city
  end

  scenario 'changing state' do
    new_state = 'NY'

    visit locations_path
    click_link @location.name
    click_link 'Edit'
    fill_in 'State', with: new_state
    click_button 'Save'

    expect(page).to have_text new_state
  end

  scenario 'changing zip' do
    new_zip = '35903'

    visit locations_path
    click_link @location.name
    click_link 'Edit'
    fill_in 'Zip', with: new_zip
    click_button 'Save'

    expect(page).to have_text new_zip
  end
end