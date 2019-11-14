class Api::RecipesController < ApplicationController
  def index 
      @children = Ingredient.all.where(ancestry: "#{params[:child]}")
    respond_to do |format|
      format.json
      format.html
    end
  end

  def new
    @ingredients = Ingredient.where("name LIKE(?)", "%#{params[:keyword]}%").where.not(ancestry: nil)
    respond_to do |format|
      format.json
      format.html
    end
  end

  def search
    if params[:q].present?
      @q = Recipe.ransack(search_params)
      @recipes = @q.result.includes(:categories,:categories_recipes).references(:categories,:categories_recipes)
    else
      params[:q] = { sorts: 'id desc' }
      @q = Recipe.ransack(params[:q])
      @recipes = Recipe.all
    end
  end

  private
  def search_params
    params.require(:q).permit(
      :sorts,
      :name_cont,
      :brand_id_eq,
      { condition_id_in: [] },
      { display_id_in: [] },
      { size_id_in: [] },
      { shipping_charge_in: [] }
      )
  end
end