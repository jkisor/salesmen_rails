require 'spec_helper'

describe SalesRep do
  describe 'attributes' do 
    [:first_name, :last_name, :sales_group, :location_id].each do |attribute|
      it { should respond_to attribute }
    end
  end
  
  describe 'validations' do
    its 'invalid without a first name' do
      rep = build(:sales_rep, first_name: ' ')
      expect(rep).to be_invalid
    end
    its 'invalid without a first name' do
      rep = build(:sales_rep, last_name: ' ')
      expect(rep).to be_invalid
    end
  end

  describe '#full_name' do
    it 'returns joined first and last name' do
      rep = build :sales_rep
      expect(rep.full_name).to eq (rep.first_name + ' ' + rep.last_name)
    end
  end
end