class Api::V1::MessagesController < ApplicationController
  before_action :set_message, only: :update

  def index
    messages = Message.all
    render json: messages, status: 200
  end

  def create
    message = Message.create(message_params)
    render json: message, status: 200
  end

  def update
    if @message.update(message_params)
      render json: @message, status: 200
    else
      error_resp = {
        error: @trip.errors.full_messages.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
    
  end

  def destroy
    message = Message.find_by(id: params[:id])
    message.destroy
    render json: {notice: 'message destroyed'}, status: 200
  end 

  private 

  def set_message
    @message = Message.find_by(id: params[:id])
  end

  def message_params
    params.permit(:username, :content)
  end

end
