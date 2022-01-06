FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone  { Faker::PhoneNumber.phone_number }
    is_available_for_missions?{ Faker::Boolean.boolean }
    rescuer_trailer_capacity { Faker::Number.number(digits: 10) }
  end

end
