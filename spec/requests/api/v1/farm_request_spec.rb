require 'rails_helper'

describe 'Farm API' do

  it "can get one farm by its id" do

    id = create(:farm).id

    get "/api/v1/farms/#{id}"

    farm = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(response).to be_successful

    expect(farm[:attributes][:name]).to be_a(String)
  end

  it 'can create a new farm' do
    user_id = create(:user).id

    post "/api/v1/farms?user_id=#{user_id}"

    farm = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(farm[:attributes][:user_id]).to eq(user_id)
  end
end
