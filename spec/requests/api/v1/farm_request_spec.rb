require 'rails_helper'

describe 'Farm API' do

  it "can get one farm by its id" do

    id = create(:farm).id

    get "/api/v1/farms/#{id}"

    farm = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(response).to be_successful

    expect(farm[:attributes][:name]).to be_a(String)
  end
end
