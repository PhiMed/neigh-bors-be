class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    if User.exists?(params[:id])
      render json: UserSerializer.new(User.find(params[:id]))
    else
      render json: {errors: {details: "Not Found"}}, status: 404
    end
  end
end
