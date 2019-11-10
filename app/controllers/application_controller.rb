class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :menubar

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :prefecture_id, :country_id])
  end

  def menubar
    @categories = Category.all
    @ingredients = Ingredient.all.where(ancestry: nil)
    @genres = Genre.all
  end

end
