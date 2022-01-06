require 'rails_helper'

describe 'Users API' do

  it "can get one user by their id" do
    id = create(:user).id

    get "/api/v1/users/#{id}"

    user = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(response).to be_successful

    expect(user[:attributes][:name]).to be_a(String)
  end
end
