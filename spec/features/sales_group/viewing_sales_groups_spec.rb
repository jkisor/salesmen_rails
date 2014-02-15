require 'spec_helper'

feature 'viewing sales groups' do
  scenario 'given no sales groups' do
    visit sales_groups_path

    expect(page).to have_text 'There are no sales groups.'
  end

  scenario 'many sales groups' do
    count = 3
    create_list(:sales_group, count)

    visit sales_groups_path

    expect(page).to have_selector('.sales-group', count: count)
  end
end