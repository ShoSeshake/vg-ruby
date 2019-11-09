class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :update, :destroy]
  
  def index
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.genres_restaurants.build
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def restaurant_params

  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def user_check
    redirect_to restaurant_path(@restaurant) unless @restaurant.user == current_user
  end
end
