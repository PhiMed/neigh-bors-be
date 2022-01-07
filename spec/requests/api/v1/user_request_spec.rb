require 'rails_helper'

describe 'Users API' do

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
    get "/api/v1/users/?email=bad_email@gmail.com"

    user = (JSON.parse(response.body, symbolize_names: true))

    expect(user[:errors][:details]).to eq("Not Found")
  end
end
