require 'spec_helper'

feature 'viewing locations' do
  scenario 'given no locations' do
    visit locations_path

    expect(page).to have_text 'There are no locations.'
  end

  scenario 'many locations' do
    count = 3
    create_list(:location, count)

    visit locations_path

    expect(page).to have_selector('.location', count: count)
  end
end