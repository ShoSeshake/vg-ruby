class Ingredient < ApplicationRecord
  has_many :ingredients_recipes
  has_many :recipes, through: :ingredients_recipes
  has_ancestry

  validates :quantity, presence: :true
end
