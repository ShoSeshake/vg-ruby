class ChatsController < ApplicationController
  def new
    user = User.find(params[:id])
    users = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    @users = follow_exchange(user,users)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @chat = Chat.new(chat_params)
    # @chat.users << current_user
    binding.pry
    if @chat.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
  private
  def chat_params
    params.require(:chat).permit(:name,
      chat_members_attributes: [:user_id]
    )
  end

  def follow_exchange(user,users)
    friends_all = user.followings + user.followers
    friends = friends_all.group_by{|i| i}.reject{|k,v| v.one?}.keys
    new_users = friends + users
    follow_exchange_user  = new_users.group_by{|i| i}.reject{|k,v| v.one?}.keys
  end
end
