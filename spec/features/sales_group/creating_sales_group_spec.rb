require 'spec_helper'

feature 'creating sales group' do
  scenario 'valid input entered' do
    sales_group = build(:sales_group)
    
    visit sales_groups_path
    click_link 'New'
    fill_in 'Description', with: sales_group.description
    click_button 'Save'

    expect(page).to have_text sales_group.description
    expect(page).to have_text 'Sales Group successfully created.'
  end

  scenario 'description field left blank' do
    sales_group = build(:sales_group, :without_description)

    visit sales_groups_path
    click_link 'New'
    fill_in 'Description', with: sales_group.description
    click_button 'Save'
    
    expect(page).to have_text "Description can't be blank"
  end
end