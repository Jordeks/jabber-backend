class MessagesController < ApplicationController

  def index
    messages = Message.all
    render json: messages, status: 200
  end

  def create
    message = Message.create(message_params)
    render json: message, status: 200
  end

  def destroy
    message = Message.find_by(id: params[:id])
    message.destroy
  end 

  private 

  def message_params
    params.permit(:username, :content)
  end

end
