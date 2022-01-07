require 'rails_helper'

describe 'Farm API' do
  it 'can find all farms' do
    farm_1 = create(:farm)
    farm_2 = create(:farm)
    farm_3 = create(:farm)

    get "/api/v1/farms"

    expect(response).to be_successful
  end

  it "can get one farm by its id" do
    id = create(:farm).id

    get "/api/v1/farms/#{id}"

    farm = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(response).to be_successful

    expect(farm[:attributes][:name]).to be_a(String)
  end

  it 'sends an error code if farm does not exist' do
    farm_1 = create(:farm)

    get "/api/v1/farms/100"

    expect(response.status).to eq(404)
  end

  it 'can create a new farm' do
    user_id = create(:user).id

    post "/api/v1/farms?user_id=#{user_id}"

    farm = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(farm[:attributes][:user_id]).to eq(user_id)
  end

  it 'sends an error code if farm is not created' do
    user_1 = create(:user)

    post "/api/v1/farms?user_id=100"

    expect(response.status).to eq(400)
  end

  it 'can update a farm' do
    user_id = create(:user).id

    patch "/api/v1/farms?user_id=#{user_id}"

    expect(farm[:attributes][:user_id]).to eq(user_1.id)
  end
end
