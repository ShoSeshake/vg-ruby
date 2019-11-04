class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :prefecture_id, :country_id])
  end

  def menubar
    @categories = Category.all.where(ancestry: nil)
    @ingredients = Ingredient.all.where(ancestry: nil)
  end

end
