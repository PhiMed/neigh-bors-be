# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_1 = User.create!(name: "Lesley", email: "lesleyasanders@gmail.com", phone: "444-555-6666", is_available_for_missions?: true, rescuer_trailer_capacity: 10, address: "727 Garden Street Hoboken, NJ 07030")
user_2 = User.create!(name: "Lesley Sanders", email: "lgsriclas@gmail.com", phone: "123-456-7890", is_available_for_missions?: true, rescuer_trailer_capacity: 10, address: "22 Shadowbrook Way Mendham, NJ 07945")
user_3 = User.create!(name: "Didi", email: "mdodson55@gmail.com", phone: "555-555-5555", is_available_for_missions?: true, rescuer_trailer_capacity: 10, address: "111 Madison Street Hoboken, NJ 07030")
user_4 = User.create!(name: "Philip", email: "phmedlin@gmail.com", phone: "444-444-4444", is_available_for_missions?: true, rescuer_trailer_capacity: 10, address: "330 Montgomery Street Jersey City, NJ 07302")
user_5 = User.create!(name: "Chloe", email: "chloe.j.price1705@gmail.com", phone: "222-222-2222", is_available_for_missions?: true, rescuer_trailer_capacity: 10, address: "100 14th Street Jersey City, NJ 07310")
user_6 = User.create!(name: "Bob", email: "Bob@gmail.com", phone: "222-222-2223", is_available_for_missions?: true, rescuer_trailer_capacity: 10, address: "123 Fake Street")

farm_1 = Farm.create!(name: "Horse Paradise", address: "727 Garden Street Hoboken, NJ 07030", number_of_animals: 10, special_needs?: false, special_needs_details: "None", user_id: user_1.id)
farm_2 = Farm.create!(name: "Lucky Horses", address: "22 Shadowbrook Way Mendham, NJ 07945", number_of_animals: 10, special_needs?: false, special_needs_details: "None", user_id: user_2.id)
farm_3 = Farm.create!(name: "Didi's Horse Retreat", address: "111 Madison Street Hoboken, NJ 07030", number_of_animals: 10, special_needs?: false, special_needs_details: "None", user_id: user_3.id)
farm_4 = Farm.create!(name: "Philip's Fillies", address: "330 Montgomery Street Jersey City, NJ 07302", number_of_animals: 10, special_needs?: false, special_needs_details: "None", user_id: user_4.id)
farm_5 = Farm.create!(name: "Chloe's Majestic Mustangs", address: "100 14th Street Jersey City, NJ 07310", number_of_animals: 10, special_needs?: false, special_needs_details: "None", user_id: user_5.id)

mission_1 = Mission.create!(farm_id: user_2.id)
mission_2 = Mission.create!(farm_id: user_3.id)
mission_3 = Mission.create!(user_id: user_3.id, farm_id: user_4.id)
mission_4 = Mission.create!(user_id: user_4.id, farm_id: user_5.id)
mission_5 = Mission.create!(user_id: user_5.id, farm_id: user_1.id)
