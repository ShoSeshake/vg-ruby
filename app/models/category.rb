class Category < ApplicationRecord
  has_many :categoires_recipes
  has_many :recipes, through: :categories_recipes
  
  has_ancestry
end
