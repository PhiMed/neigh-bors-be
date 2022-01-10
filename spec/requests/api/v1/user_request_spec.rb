require 'rails_helper'

describe 'Users API' do
  it 'can get all users' do
    user_1 = create(:user)
    user_2 = create(:user)
    user_3 = create(:user)

    get "/api/v1/users"

    expect(response).to be_successful

    users = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(users.count).to eq(3)

    users.each do |user|
      expect(user[:attributes]).to have_key(:name)
      expect(user[:attributes][:name]).to be_a(String)
    end
  end

  it "can get one user by their id" do
    id = create(:user).id

    get "/api/v1/users/#{id}"

    user = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(response).to be_successful

    expect(user[:attributes][:name]).to be_a(String)
  end

  it "can get one user by their email" do
    user_1 = create(:user, email: "user_1@gmail.com")
    user_2 = create(:user, email: "user_2@gmail.com")

    get "/api/v1/users/?email=user_2@gmail.com"

    user = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(response).to be_successful

    expect(user[:attributes][:email]).to eq("#{user_2.email}")
    expect(user[:attributes][:email]).to_not eq("#{user_1.email}")

  end

  it 'sends an error code if user does not exist' do
    get "/api/v1/users/1000"

    error = (JSON.parse(response.body, symbolize_names: true))[:errors][:details]

    expect(response.status).to eq(404)
    expect(error).to eq("Not Found")
  end

  it 'can create a new user' do

    user = User.new(id: 8, name: 'bob', email: 'cats@cats.com', phone: '123-2345', rescuer_trailer_capacity: 10, address: '123 street')

    post "/api/v1/users?id=#{user.id}&name=#{user.name}&email=#{user.email}&phone=#{user.phone}&rescuer_trailer_capacity=#{user.rescuer_trailer_capacity}&address=#{user.address}"

    expect(response.status).to eq(201)

    get "/api/v1/users?id=#{user.id}"

    user = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(response).to be_successful
  end

  it 'sends an error code if user is not created' do
    post "/api/v1/users?user_id=1000"

    error = (JSON.parse(response.body, symbolize_names: true))[:errors][:details]

    expect(response.status).to eq(400)
    expect(error).to eq("There was an error completing this request")
  end

  it 'can update a user' do
    user_1 = create(:user)
    name = User.first.name
    email = User.first.email
    phone = User.first.phone
    is_available_for_missions = User.first.is_available_for_missions?
    rescuer_trailer_capacity = User.first.rescuer_trailer_capacity

    user_params = {
                    name: "Bob",
                    email: "Bob@gmail.com",
                    phone: "555-444-3333",
                    is_available_for_missions?: true,
                    rescuer_trailer_capacity: 20,
                  }

    header = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/users/#{user_1.id}", headers: header, params: JSON.generate(user_params)

    user = User.find_by(id: user_1.id)

    expect(response).to be_successful
    expect(user.name).to eq(user_params[:name])
    expect(user.name).to_not eq(name)
    expect(user.email).to eq(user_params[:email])
    expect(user.email).to_not eq(email)
  end

  it 'sends an error code if a user is not updated' do
    user_1 = create(:user)

    user_params = {
                    name: "Bob",
                    email: "",
                    phone: "555-444-3333",
                    is_available_for_missions?: true,
                    rescuer_trailer_capacity: 20,
                  }

    header = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/users/#{user_1.id}", headers: header, params: JSON.generate(user_params)

    expect(response.status).to eq(400)
  end

  it 'can delete a user' do
    user_1 = create(:user)
    user_2 = create(:user)

    expect(User.count).to eq(2)

    delete "/api/v1/users/#{user_1.id}"

    expect(response).to be_successful

    expect(User.count).to eq(1)
  end

end
