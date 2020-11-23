class MessagesController < ApplicationController

  def index
    messages = Message.all
    render json: messages, status: 200
  end

end
