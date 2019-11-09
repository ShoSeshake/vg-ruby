class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :update, :destroy]
  
  def index
  end

  def show
  end

  def new
    @genres = Genre.all
    @restaurant = Restaurant.new
    @restaurant.genres_restaurants.build
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to new_recipe_path
    end
  end

  def edit
    @genres = Genre.all
  end

  def update
    if @restaurant.update(edit_params)
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to edit_restaurant_path(@restaurant)
    end
  end

  def destroy
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :text,
      :lunch_price_id,
      :dinner_price_id,
      :review,
      :visited_time,
      :url,
      :hp,
      :address,
      :prefecture_id,
      :telephone,
      :vegan_friendly_id,
      genres_restaurants_attributes: [:genre_id]
      )
      .merge(user_id: current_user.id)
  end

  def edit_params
    params.require(:restaurant).permit(
      :name,
      :text,
      :lunch_price_id,
      :dinner_price_id,
      :review,
      :visited_time,
      :url,
      :hp,
      :address,
      :prefecture_id,
      :telephone,
      :vegan_friendly_id,
      genres_restaurants_attributes: [:id,:_destroy,:genre_id]
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
