class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index,:show]

  def index
    @restaurants = Restaurant.order("created_at DESC")
  end

  def show
    @restaurant_comment = RestaurantComment.new
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.photos.build
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    binding.pry
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to new_restaurant_path
    end
  end

  def edit
  end

  def update
    if @restaurant.update(edit_params)
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to edit_restaurant_path(@restaurant)
    end
  end

  def destroy
    if @restaurant.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  
  private

  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :text,
      :price_id,
      :review,
      :visited_time,
      :location,
      :gurunavi_id,
      :vegan_friendly_id,
      photos_attributes: [:url]
      )
      .merge(user_id: current_user.id)
  end

  def edit_params
    params.require(:restaurant).permit(
      :name,
      :text,
      :price,
      :review,
      :visited_time,
      :location,
      :gurunavi_id,
      :vegan_friendly_id,
      photos_attributes: [:url, :id, :_destroy]
      )
      .merge(user_id: current_user.id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def user_check
    redirect_to restaurant_path(@restaurant) unless @restaurant.user == current_user
  end
end
