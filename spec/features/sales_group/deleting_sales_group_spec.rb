require 'spec_helper'

feature 'deleting a sales group' do
  scenario 'succeeds if sales group exists' do
    sales_group = create :sales_group
    
    visit sales_groups_path
    click_link "Group ##{sales_group.id}"
    click_link 'Delete'
    
    expect(page).not_to have_text sales_group.description
    expect(page).to have_text 'Sales Group successfully deleted.'
  end
end