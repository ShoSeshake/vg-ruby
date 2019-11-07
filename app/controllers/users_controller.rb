class UsersController < ApplicationController

  def show
    @ingredient = Ingredient.find(params[:id])
  end
end
