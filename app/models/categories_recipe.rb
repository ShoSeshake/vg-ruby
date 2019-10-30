class CategoriesRecipe < ApplicationRecord
  belongs_to :recipe
  belogns_to :ingredient

  validates :quantity
end
