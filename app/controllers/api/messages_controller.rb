class Api::MessagesController < ApplicationController
  def index 
      @chat = Chat.find(params[:chat_id])
      @messages = @chat.messages.order("id DESC").limit(10)
      render 'api/messages/index.js.erb'
  end

  def reload
    @chat = Chat.find(params[:chat_id])
    last_message_id = params[:message_id].to_i
    @messages = @chat.messages.includes(:user).where("id > #{last_message_id} && user_id != #{current_user.id}")
  end

  def previous
    @chat = Chat.find(params[:chat_id])
    old_message_id = params[:message_id].to_i
    @messages = @chat.messages.includes(:user).where("id < #{old_message_id}").order("id DESC").limit(10)
  end
end