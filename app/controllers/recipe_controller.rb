class RecipeController < ApplicationController

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show

  end

  def new
    @recipe = Recipe.new
    @recipe.images.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
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
    images_attributes: [:url]
    )
    .merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
