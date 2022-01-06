FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    t.string :email
    t.string :phone
    t.integer :user_type
    t.boolean :is_available_for_missions?
    t.integer :rescuer_trailer_capacity

  end

end
