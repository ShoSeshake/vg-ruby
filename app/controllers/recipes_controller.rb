class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :update, :destroy]

  def index
    @recipes = Recipe.order("created_at DESC").limit(10)
    @restaurants = Restaurant.order("created_at DESC").limit(10)
  end

  def show
    @comment = Comment.new
  end

  def new
    @recipe = Recipe.new
    @recipe.images.build
    @recipe.instructions.build
    @recipe.categories_recipes.build
    @recipe.ingredients_recipes.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      @recipe.images = []
      @recipe.images.build
      redirect_to new_recipe_path
    end
  end

  def edit
  end

  def update
    if @recipe.update(edit_params)
      redirect_to recipe_path(params[:id])
    else
      redirect_to edit_recipe_path(@recipe)
    end
  end

  def destroy
    if @recipe.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @recipes = Recipe.order("created_at DESC")
  end

  private
  def recipe_params
    params.require(:recipe).permit(
    :name,
    :text,
    :serving,
    images_attributes: [:url],
    instructions_attributes: [:text,:position],
    categories_recipes_attributes: [:category_id],
    ingredients_recipes_attributes: [:ingredient_id,:quantity]
    )
    .merge(user_id: current_user.id)
  end

  def edit_params
    params.require(:recipe).permit(
    :name,
    :text,
    :serving,
    images_attributes: [:url, :_destroy, :id],
    instructions_attributes: [:text,:position, :_destroy, :id],
    categories_recipes_attributes: [:category_id, :_destroy, :id],
    ingredients_recipes_attributes: [:ingredient_id,:quantity, :_destroy, :id]
    )
    .merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def user_check
    redirect_to recipe_path(@recipe) unless @recipe.user == current_user
  end
end
