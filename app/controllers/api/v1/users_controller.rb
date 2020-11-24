class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users, status: 200
  end

end
