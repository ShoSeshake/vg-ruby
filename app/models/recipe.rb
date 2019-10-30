class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments,  dependent: :destroy
  has_many :images,    dependent: :destroy

  has_many :ingredients_recipes
  has_many :categories, through: :ingredients_recipes

  has_many :categoires_recipes
  has_many :ingredients, through: :categories_recipes

  validates :images, length: {maximum: 5, minimum: 1}
  accepts_nested_attributes_for :images

  validates :name, :text, :serving, presence: :ture

end
