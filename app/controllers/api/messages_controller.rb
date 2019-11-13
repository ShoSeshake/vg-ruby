class Api::MessagesController < ApplicationController
  def index 
      @chat = Chat.find(params[:chat_id])
      render 'api/messages/index.js.erb'
  end

  def reload
    @chat = Chat.find(params[:chat_id])
    last_message_id = params[:message_id].to_i
    @messages = @chat.messages.includes(:user).where("id > #{last_message_id} && user_id != #{current_user.id}")
    # binding.pry
  end
end