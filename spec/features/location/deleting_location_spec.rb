require 'spec_helper'

feature 'deleting a location' do
  scenario 'succeeds if location exists' do
    location = create :location
    visit locations_path
    click_link location.name
    click_link 'Delete'
    
    expect(page).not_to have_text location.name
    expect(page).to have_text 'Location successfully deleted.'
  end
end