class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments,                                  dependent: :destroy
  has_many :images,                                    dependent: :destroy
  has_many :instructions,                              dependent: :destroy
  has_many :likes,                                     dependent: :destroy

  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes

  has_many :categories_recipes
  has_many :categories, through: :categories_recipes

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :instructions, allow_destroy: true
  accepts_nested_attributes_for :categories_recipes, allow_destroy: true
  accepts_nested_attributes_for :ingredients_recipes, allow_destroy: true

  validates :images, length: {maximum: 10, minimum: 1}
  validates :instructions, :categories_recipes, :ingredients_recipes, length: {minimum: 1}

  validates :name, :text, :serving, presence: :true

  ransacker :likes_count do
    query = '(SELECT COUNT(likes.recipe_id) FROM likes where likes.recipe_id = recipes.id GROUP BY likes.recipe_id)'
    Arel.sql(query)
  end

  ransacker :comments_count do
    query = '(SELECT COUNT(comments.recipe_id) FROM comments where comments.recipe_id = recipes.id GROUP BY comments.recipe_id)'
    Arel.sql(query)
  end

end
