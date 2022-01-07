require 'rails_helper'

describe 'Farm API' do
  it 'can find all farms' do
    farm_1 = create(:farm)
    farm_2 = create(:farm)
    farm_3 = create(:farm)

    get "/api/v1/farms"

    expect(response).to be_successful

    farms = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(farms.count).to eq(3)

    farms.each do |farm|
      expect(farm[:attributes]).to have_key(:name)
      expect(farm[:attributes][:name]).to be_a(String)
    end
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

    get "/api/v1/farms/1000"

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
    user_1 = create(:user)
    farm_1 = create(:farm)
    name = Farm.first.name
    address = Farm.first.address
    number_of_animals = Farm.first.number_of_animals
    special_needs = Farm.first.special_needs?
    special_needs_details = Farm.first.special_needs_details
    user_id = Farm.first.user_id

    farm_params = {
                    name: "Bob's Farm",
                    address: "123 Main Street",
                    number_of_animals: 10,
                    special_needs: false,
                    special_needs_details: "None",
                    user_id: user_1.id
                  }

    header = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/farms/#{farm_1.id}", headers: header, params: JSON.generate(farm_params)

    farm = Farm.find_by(id: farm_1)

    expect(response).to be_successful
    expect(farm.name).to eq(farm_params[:name])
    expect(farm.name).to_not eq(name)
    expect(farm.address).to eq(farm_params[:address])
    expect(farm.address).to_not eq(address)
  end

  xit 'sends an error code if a farm is not updated' do
    user_1 = create(:user)
    farm_1 = create(:farm, user: user_1)
    name = Farm.first.name
    address = Farm.first.address
    number_of_animals = Farm.first.number_of_animals
    special_needs = Farm.first.special_needs?
    special_needs_details = Farm.first.special_needs_details
    user_id = Farm.first.user_id

    farm_params = {
                    name: "",
                    address: "",
                    number_of_animals: 10,
                    special_needs: false,
                    special_needs_details: "None",
                    user_id: user_1.id
                  }

    header = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/farms/#{farm_1.id}", headers: header, params: JSON.generate(farm_params)

    Farm.find_by(id: farm_1)

    expect(response.status).to eq(400)
  end

  it 'can delete a farm' do
    farm_1 = create(:farm)
    farm_2 = create(:farm)

    expect(Farm.count).to eq(2)

    delete "/api/v1/farms/#{farm_1.id}"

    expect(response).to be_successful

    expect(Farm.count).to eq(1)
  end
end
