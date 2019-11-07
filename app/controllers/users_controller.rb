class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @commented_recipes = []
    @user.comments.each do |c|
      recipe = Recipe.find(c.recipe_id)
      @commented_recipes << recipe
    end
  end
end
