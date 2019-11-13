class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @chats = current_user.chats
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      @chat = @message.chat
      render '/messages/create.js.erb'
    else
      redirect_to messages_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :url,:chat_id).merge(user_id: current_user.id)
  end
  def user_check
    redirect_to root_path unless user_signed_in?
  end
end
