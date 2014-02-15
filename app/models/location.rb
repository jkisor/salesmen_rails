class Location < ActiveRecord::Base
  has_one :sales_rep, :dependent => :nullify

  validates_presence_of :name, :address_line_1, :city, :state, :zip

  def self.all_available(options = {})
    all.select { |loc| (loc.available? || loc.sales_rep == options[:to])}
  end

  def available?
    sales_rep.nil?
  end
end