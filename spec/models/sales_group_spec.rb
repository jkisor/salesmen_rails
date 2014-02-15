require 'spec_helper'

describe SalesGroup do
  [:description, :sales_reps, :locations].each do |attribute|
    it { should respond_to attribute }
  end

  describe 'validations' do
    its 'invalid without a description' do
      group = build(:sales_group, description: ' ')
      expect(group).to be_invalid
    end
  end
end
