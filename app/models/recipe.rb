class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments,  dependent: :destroy
  has_many :images,    dependent: :destroy

  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes

  has_many :categories_recipes
  has_many :categories, through: :categories_recipes

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :categories_recipes
  accepts_nested_attributes_for :ingredients_recipes

  validates :images, length: {maximum: 10, minimum: 1}

  validates :name, :text, :serving, presence: :ture

end
