FactoryGirl.define do
  factory :sales_group do
    description 'Seller of things'

    trait :without_description do
      description ' '
    end

    factory :invalid_sales_group do
      without_description
    end

  end
end