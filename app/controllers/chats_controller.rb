class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat, only:[:edit,:update,:destroy]
  before_action :user_check, only:[:edit,:update,:destroy]

  def new
    user = User.find(params[:id])
    existing_users = User.find(params[:user_ids]) if params[:user_ids]
    users = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    @users = follow_exchange(user,users)
    @users = @users - existing_users if params[:user_ids]
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to messages_path
    else
      redirect_to root_path
    end
  end
  
  def edit
    render 'chats/edit.js.erb'
  end

  def update
    if @chat.update(edit_params)
      redirect_to messages_path
    else
      redirect_to root_path
    end
  end

  def destroy
    if @chat.destroy
      redirect_to messages_path
    else
      redirect_to messages_path
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:name,
      chat_members_attributes: [:user_id]
    )
  end

  def edit_params
    params.require(:chat).permit(:name,
      chat_members_attributes: [:id,:user_id,:_destroy]
    )
  end

  def follow_exchange(user,users)
    friends_all = user.followings + user.followers
    friends = friends_all.group_by{|i| i}.reject{|k,v| v.one?}.keys
    new_users = friends + users
    follow_exchange_user  = new_users.group_by{|i| i}.reject{|k,v| v.one?}.keys
  end

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def user_check
    redirect_to messages_path unless @chat.users.include?(current_user)
  end
end
