FactoryGirl.define do
  sequence(:name) { |n| "Example Name #{n}" }
  
  factory :location do
    name
    address_line_1 '123 W 3th Ave'
    address_line_2 'Apt #123'
    city 'San Mateo'
    state 'CA'
    zip '94402'

    factory :invalid_location do
      name ' '
      address_line_1 ' '
      address_line_2 ' '
      city ' '
      state ' '
      zip ' '
    end

    trait :without_name do
      name ' '
    end

    trait :without_address_line_1 do
      address_line_1 ' '
    end

    trait :without_city do 
      city ' '
    end

    trait :without_state do
      state ' '
    end

    trait :without_zip do
      zip ' '
    end
  end
end
