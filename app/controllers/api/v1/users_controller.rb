class Api::V1::UsersController < ApplicationController
  def index
    if params[:email].present?
      if User.where(email: "#{params[:email]}").any?
        render json: UserSerializer.new(User.where(email: "#{params[:email]}").first)
      end
    else
      render json: UserSerializer.new(User.all)
    end
  end

  def show
    if User.exists?(params[:id])
      render json: UserSerializer.new(User.find(params[:id]))
    else
      render json: {errors: {details: "Not Found"}}, status: 404
    end
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: UserSerializer.new(User.find(user.id)), status: 201
    else
      render json: {errors: {details: "There was an error completing this request"}}, status: 400
    end
  end

  def update
    user = User.update(params[:id], user_params)
    if user.save
      render json: UserSerializer.new(user)
    else
      render json: {errors: {details: "There was an error completing this request"}}, status: 400
    end
  end

  def destroy
    render json: User.delete(params[:id])
  end

  private

  def user_params
    params.permit(:id, :address, :name, :email, :phone, :is_available_for_missions?,
               :rescuer_trailer_capacity)
  end
end
