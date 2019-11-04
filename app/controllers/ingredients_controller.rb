class IngredientsController < ApplicationController
  before_action :menubar
  def show
    @ingredient = Ingredient.find(params[:id])
  end
end
