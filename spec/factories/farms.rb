FactoryBot.define do
  factory :farm do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    number_of_animals { Faker::Number.number(digits: 1) }
    special_needs?{ Faker::Boolean.boolean }
    special_needs_details {Faker::Lorem.sentence }
    user
  end
end
