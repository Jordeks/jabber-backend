class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users, status: 200
  end

  def create
    byebug
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: user, status: 200
    else
      response = {
        error: user.errors.full_messages.to_sentence
      }
      render json: response, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :location)
  end

end
