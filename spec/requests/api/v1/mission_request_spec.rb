require 'rails_helper'

describe 'Mission API' do
  it 'can get all missions' do
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

  it 'can create a new mission' do
    user_1 = create(:user)
    farm_1 = create(:farm)
    mission_1 = create(:mission, user_id: user_1.id, farm_id: farm_1.id)

    post "/api/v1/missions?user_id=#{user_1.id}"

    mission = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(mission[:attributes][:user_id]).to eq(user_1.id)
  end

  it 'sends an error code if mission is not created' do
    user_1 = create(:user)
    user_2 = create(:user)
    farm_1 = create(:farm)
    mission_1 = create(:mission, user_id: user_1.id, farm_id: farm_1.id)

    post "/api/v1/missions?user_id=#{user_2.id}"

    expect(response.status).to eq(400)
  end

  it 'can update a mission' do
    user_1 = create(:user)
    user_2 = create(:user, id: 5)
    farm_1 = create(:farm)
    farm_2 = create(:farm, id: 5)
    mission_1 = create(:mission, user_id: user_1.id, farm_id: farm_1.id)
    user_id = Mission.first.user_id
    farm_id = Mission.first.farm_id

    mission_params = {
                      user_id: 5,
                      farm_id: 5
                     }

    header = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/missions/#{mission_1.id}", headers: header, params: JSON.generate(mission_params)

    mission = Mission.find_by(id: mission_1)

    expect(response).to be_successful
    expect(mission.user_id).to eq(mission_params[:user_id])
    expect(mission.user_id).to_not eq(user_id)
    expect(mission.farm_id).to eq(mission_params[:farm_id])
    expect(mission.farm_id).to_not eq(farm_id)
  end

  it 'can delete a mission' do
    user_1 = create(:user)
    farm_1 = create(:farm)
    mission_1 = create(:mission, user_id: user_1.id, farm_id: farm_1.id)
    mission_2 = create(:mission, user_id: user_1.id, farm_id: farm_1.id)

    expect(Mission.count).to eq(2)

    delete "/api/v1/missions/#{mission_1.id}"

    expect(response).to be_successful

    expect(Mission.count).to eq(1)
  end
end
