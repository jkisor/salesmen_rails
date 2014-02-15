FactoryGirl.define do
  factory :sales_rep do
    first_name 'John'
    last_name 'Doe'

    sales_group
    location

    factory :invalid_sales_rep do
      first_name ' '
      last_name ' '
    end
  end
end