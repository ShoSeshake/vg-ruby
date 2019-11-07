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
end