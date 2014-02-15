require 'spec_helper'
feature 'updating sales group' do
  given(:new_description) { 'Gordan Freeman' }

  scenario 'changing the description' do
    sales_group = create :sales_group

    visit sales_groups_path
    click_link "Group ##{sales_group.id}"
    click_link 'Edit'
    fill_in 'Description', with: new_description
    click_button 'Save'

    expect(page).to have_text new_description
    expect(page).to have_text 'Sales Group successfully updated.'
  end
end