require 'rails_helper'

describe 'Mission API' do
  it 'can find all farms' do
    farm_1 = create(:farm)
    user_1 = create(:user)
    mission_1 = create(:mission, user_id: user_1.id, farm_id: farm_1.id)
    mission_2 = create(:mission, user_id: user_1.id, farm_id: farm_1.id)
    mission_3 = create(:mission, user_id: user_1.id, farm_id: farm_1.id)

    get "/api/v1/missions"

    expect(response).to be_successful

    missions = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(missions.count).to eq(3)

    missions.each do |mission|
      expect(mission[:attributes]).to have_key(:user_id)
      expect(mission[:attributes][:user_id]).to be_an(Integer)
      expect(mission[:attributes]).to have_key(:farm_id)
      expect(mission[:attributes][:farm_id]).to be_an(Integer)
    end
  end

  it "can get one mission by its id" do
    farm = create(:farm)
    id = create(:mission, farm_id: farm.id).id

    get "/api/v1/missions/#{id}"

    mission = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(response).to be_successful

    expect(mission[:attributes][:farm_id]).to eq(farm.id)
  end

  it 'sends an error code if mission does not exist' do
    farm_1 = create(:farm)
    user_1 = create(:user)
    mission_1 = create(:mission, user_id: user_1.id, farm_id: farm_1.id)

    get "/api/v1/missions/1000"

    expect(response.status).to eq(404)
  end
end
