require 'rails_helper'

describe 'Mission API' do

  it "can get one mission by its id" do

    farm = create(:farm)
    id = create(:mission, farm_id: farm.id).id

    get "/api/v1/missions/#{id}"

    mission = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(response).to be_successful

    expect(mission[:attributes][:farm_id]).to eq(farm.id)
  end
end
