class SalesRep < ActiveRecord::Base
  belongs_to :sales_group
  belongs_to :location
  
  validates_presence_of :first_name, :last_name

  def full_name
    first_name + ' ' + last_name
  end

  def location
    Location.find location_id
  end
end
