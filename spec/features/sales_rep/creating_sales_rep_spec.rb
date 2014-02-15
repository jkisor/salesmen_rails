require 'spec_helper'

feature 'creating sales rep' do
  scenario 'valid input entered' do
    sales_rep = build :sales_rep

    visit sales_reps_path
    click_link 'New'
    enter_name sales_rep.full_name
    select_sales_group sales_rep.sales_group
    select_location sales_rep.location
    click_button 'Save'
  
    expect(page).to have_text sales_rep.full_name
    expect(page).to have_text sales_rep.sales_group.id
    expect(page).to have_text sales_rep.location.name
    expect(page).to have_text 'Sales Rep successfully created.'
  end

  scenario 'name fields left blank' do
    visit sales_reps_path
    click_link 'New'
    enter_name ' '
    click_button 'Save'

    expect(page).to have_text "First name can't be blank"
    expect(page).to have_text "Last name can't be blank"
  end
end
