require 'spec_helper'

feature 'creating a location' do
  scenario 'valid input entered' do
    location = build :location
    
    visit locations_path
    click_link 'New'
    fill_in_location_fields location
    click_button 'Save'

    expect(page).to have_text location.name
    expect(page).to have_text location.address_line_1
    expect(page).to have_text location.address_line_2
    expect(page).to have_text location.city
    expect(page).to have_text location.state
    expect(page).to have_text location.zip

    expect(page).to have_text 'Location successfully created.'
  end

  scenario 'name field left blank' do
    location = build(:location, :without_name)

    visit locations_path
    click_link 'New'
    fill_in_location_fields location
    click_button 'Save'

    expect(page).to have_text "Name can't be blank"
  end

  scenario 'address field left blank' do
    location = build(:location, :without_address_line_1)

    visit locations_path
    click_link 'New'
    fill_in_location_fields location
    click_button 'Save'

    expect(page).to have_text "Address line 1 can't be blank"
  end

  scenario 'city field left blank' do
    location = build(:location, :without_city)

    visit locations_path
    click_link 'New'
    fill_in_location_fields location
    click_button 'Save'

    expect(page).to have_text "City can't be blank"
  end

  scenario 'state field left blank' do
    location = build(:location, :without_state)

    visit locations_path
    click_link 'New'
    fill_in_location_fields location
    click_button 'Save'

    expect(page).to have_text "State can't be blank"
  end

  scenario 'zip field left blank' do
    location = build(:location, :without_zip)

    visit locations_path
    click_link 'New'
    fill_in_location_fields location
    click_button 'Save'

    expect(page).to have_text "Zip can't be blank"
  end
end