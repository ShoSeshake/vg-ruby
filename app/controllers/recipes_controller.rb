class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show

  end

  def new
    @categories = Category.all
    @recipe = Recipe.new
    @recipe.images.build
    @recipe.categories_recipes.build
    @recipe.ingredients_recipes.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      @categories = Category.all
      @recipe.images = []
      @recipe.images.build
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def recipe_params
    params.require(:recipe).permit(
    :name,
    :text,
    :serving,
    images_attributes: [:url],
    categories_recipes_attributes: [:category_id],
    ingredients_recipes_attributes: [:ingredient_id,:quantity]
    )
    .merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
