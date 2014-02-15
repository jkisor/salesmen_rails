feature 'viewing sales reps' do
  scenario 'given no sales reps' do
    visit sales_reps_path

    expect(page).to have_text 'There are no sales reps.'
  end

  scenario 'many sales reps' do
    count = 3
    create_list(:sales_rep, count)

    visit sales_reps_path

    expect(page).to have_selector('.sales-rep', count: count)
  end
end