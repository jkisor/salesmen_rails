module Features
  def fill_in_location_fields location
    fill_in 'Name', with: location.name
    fill_in 'Address line 1', with: location.address_line_1
    fill_in 'Address line 2', with: location.address_line_2
    fill_in 'City', with: location.city
    fill_in 'State', with: location.state
    fill_in 'Zip', with: location.zip  
  end 
end