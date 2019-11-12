class RestaurantCommentsController < ApplicationController
  before_action :set_restaurant
  before_action :authenticate_user!

  def create
    @restaurant_comment = @restaurant.restaurant_comments.new(restaurant_comment_params)
    if @restaurant_comment.save
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to restaurant_path(@restaurant)
    end
  end

  private
  def restaurant_comment_params
    params.require(:restaurant_comment).permit(
      :title,
      :text,
      :review,
      :visited_time
    )
    .merge(user_id: current_user.id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
