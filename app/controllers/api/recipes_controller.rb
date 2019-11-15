class Api::RecipesController < ApplicationController
  def index 
      @children = Ingredient.all.where(ancestry: "#{params[:child]}")
    respond_to do |format|
      format.json
      format.html
    end
  end

  def new
    @ingredients = Ingredient.where("name LIKE(?)", "#{params[:keyword]}%").where.not(ancestry: nil)
    respond_to do |format|
      format.json
      format.html
    end
  end

  def search
      @q = Recipe.ransack(search_params)
      @recipes = @q.result(distinct: true)
      @recipes = average_review(@recipes,params[:review]) if params[:review].present?
  end

  private
  def search_params
    params.require(:q).permit(
      :sorts,
      :name_cont,
      { categories_recipes_category_id_in: [] },
      { ingredients_recipes_ingredient_id_in: [] }
      )
  end

  def average_review(recipes,params_score)
    sorted_recipes = []
    recipes.each do |recipe|
      if recipe.comments.present?
        recipe_average = recipe.comments.average(:review)
        sorted_recipes << recipe if recipe_average >= params_score.to_i
      end
    end
    return sorted_recipes
  end
end