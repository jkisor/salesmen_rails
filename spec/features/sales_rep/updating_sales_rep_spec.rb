require 'spec_helper'
feature 'updating sales rep' do
  background { @sales_rep = create :sales_rep }

  scenario 'changing first and last name' do
    updated_name = 'Gordan Freeman'

    visit sales_reps_path
    click_link @sales_rep.full_name
    click_link 'Edit'
    enter_name updated_name
    click_button 'Save'

    expect(page).to have_text updated_name
    expect(page).to have_text 'Sales Rep successfully updated.'
  end

  scenario 'changing sales group' do
    new_group = create :sales_group

    visit sales_reps_path
    click_link @sales_rep.full_name
    click_link 'Edit'
    select_sales_group new_group
    click_button 'Save'

    expect(page).to have_text 'Sales Group: ' + new_group.id.to_s
    expect(page).to have_text 'Sales Rep successfully updated.'
  end

  scenario 'changing location' do
    new_location = create :location

    visit sales_reps_path
    click_link @sales_rep.full_name
    click_link 'Edit'
    select_location new_location
    click_button 'Save'

    expect(page).to have_text 'Location: ' + new_location.name
    expect(page).to have_text 'Sales Rep successfully updated.'
  end
end