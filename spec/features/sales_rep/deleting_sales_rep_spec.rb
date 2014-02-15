require 'spec_helper'

feature 'deleting a sales rep' do
  scenario 'succeeds if sales rep exists' do
    sales_rep = create :sales_rep

    visit sales_reps_path
    click_link sales_rep.full_name
    click_link 'Delete'

    expect(page).not_to have_text sales_rep.full_name
    expect(page).to have_text 'Sales Rep successfully deleted.'
  end
end