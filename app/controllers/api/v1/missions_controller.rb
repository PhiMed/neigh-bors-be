class Api::V1::MissionsController < ApplicationController

  def index
    render json: MissionSerializer.new(Mission.all)
  end

  def show
    if Mission.exists?(params[:id])
      render json: MissionSerializer.new(Mission.find(params[:id]))
    else
      render json: {errors: {details: "Not Found"}}, status: 404
    end
  end

  def create
    mission = Mission.create(mission_params)
    if mission.save
      render json: MissionSerializer.new(Mission.find(mission.id)), status: 201
    else
      render json: {errors: {details: "There was an error completing this request"}}, status: 400
    end
  end

  def update
    mission = Mission.update(params[:id], mission_params)
    if mission.save
      render json: MissionSerializer.new(mission)
    else
      render json: {errors: {details: "There was an error completing this request"}}, status: 400
    end
  end

  def destroy
    render json: Mission.delete(params[:id])
  end

  private

  def mission_params
    params.permit(:user_id, :farm_id)
  end
end
