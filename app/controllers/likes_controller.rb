class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe

  def create
    @like = Like.create(user_id: current_user.id, recipe_id: @recipe.id)
    render 'likes/create.js.erb'
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, recipe_id: @recipe.id)
    @like.destroy
    render 'likes/create.js.erb'
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

end