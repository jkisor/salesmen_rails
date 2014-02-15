require 'spec_helper'

describe Location do
  [:name, :address_line_1, :address_line_2, :city, :state, :zip, :sales_rep].each do |attribute|
    it { should respond_to attribute }
  end

  describe 'validations' do
    [:name, :city, :state, :zip, :address_line_1].each do |missing|
      its ('invalid without ' + missing.to_s) do
        trait = 'without_' + missing.to_s
        location = build(:location, trait.to_sym)
        expect(location).to be_invalid
      end
    end
  end
end