class Api::MessagesController < ApplicationController
  def index 
      @chat = Chat.find(params[:chat_id])
      render 'api/messages/index.js.erb'
  end
end