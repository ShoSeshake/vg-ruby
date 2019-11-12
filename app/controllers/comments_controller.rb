class CommentsController < ApplicationController
  before_action :set_recipe
  before_action :authenticate_user!

  def create
    @comment = @recipe.comments.new(comment_params)
    if @comment.save
      redirect_to recipe_path(@comment.recipe)
    else
      redirect_to recipe_path(@recipe)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(
      :text,
      :review
    )
    .merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
