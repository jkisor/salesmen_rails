module Features
  def enter_name name
    names = name.split ' '

    fill_in 'First name', with: names[0]
    fill_in 'Last name', with: names[1]
  end

  def select_sales_group group
    select(group.id, :from => 'sales_rep_sales_group_id')
  end

  def select_location location
    select(location.name, :from => 'sales_rep_location_id')
  end
end