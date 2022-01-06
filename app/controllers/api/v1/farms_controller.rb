class Api::V1::FarmsController < ApplicationController
  def index
    render json: FarmSerializer.new(Farm.all)
  end

  def show
    if Farm.exists?(params[:id])
      render json: FarmSerializer.new(Farm.find(params[:id]))
    else
      render json: {errors: {details: "Not Found"}}, status: 404
    end
  end

  def create
    farm = Farm.create(farm_params)
    if farm.save
      render json: FarmSerializer.new(Farm.find(farm.id)), status: 201
    else
      render json: {errors: {details: "There was an error completing this request"}}, status: 400
    end
  end

  def update
    farm = Farm.update(params[:id], farm_params)
    if farm.save
      render json: FarmSerializer.new(farm)
    else
      render json: {errors: {details: "There was an error completing this request"}}, status: 400
    end
  end

  def destroy
    render json: Farm.delete(params[:id])
  end

  private

  def farm_params
    params.permit(:name, :address, :number_of_animals, :special_needs?, :special_needs_details, :user_id)
  end
end
