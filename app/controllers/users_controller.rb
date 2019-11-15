class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @commented_recipes = []
    @user.comments.each do |c|
      recipe = Recipe.find(c.recipe_id)
      @commented_recipes << recipe
    end
    @commented_reviews = []
    @user.restaurant_comments.each do |c|
      review = Restaurant.find(c.restaurant_id)
      @commented_reviews <<  review
    end
  end
end
