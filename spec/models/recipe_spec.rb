# class Recipe < ApplicationRecord
#   belongs_to :user
#   has_many :comments,                                  dependent: :destroy
#   has_many :images,                                    dependent: :destroy
#   has_many :instructions,                              dependent: :destroy
#   has_many :likes,                                     dependent: :destroy

#   has_many :ingredients_recipes
#   has_many :ingredients, through: :ingredients_recipes

#   has_many :categories_recipes
#   has_many :categories, through: :categories_recipes

#   accepts_nested_attributes_for :images, allow_destroy: true
#   accepts_nested_attributes_for :instructions, allow_destroy: true
#   accepts_nested_attributes_for :categories_recipes, allow_destroy: true
#   accepts_nested_attributes_for :ingredients_recipes, allow_destroy: true

#   validates :images, length: {maximum: 10, minimum: 1}
#   validates :instructions, :categories_recipes, :ingredients_recipes, length: {minimum: 1}

#   validates :name, :text, :serving, presence: :ture

# end
require 'rails_helper'
describe Recipe do
  describe '#create' do
    it "is valid with a name, text, review, serving" do
      recipe = build(:recipe)
      expect(recipe).to be_valid
    end

    it "is invalid without a name" do
      recipe = build(:recipe, name: nil)
      recipe.valid?
      expect(recipe.errors[:name]).to include("can't be blank")
    end
    
    it "is invalid without a text" do
      recipe = build(:recipe, text: nil)
      recipe.valid?
      expect(recipe.errors[:text]).to include("can't be blank")
    end
    
    it "is invalid without a serving" do
      recipe = build(:recipe, serving: nil)
      recipe.valid?
      expect(recipe.errors[:serving]).to include("can't be blank")
    end

    it "is invalid without a user" do
      recipe = build(:recipe, user: nil)
      recipe.valid?
      expect(recipe.errors[:user]).to include("must exist")
    end

    it "is invalid without a user" do
      recipe = build(:recipe, images: nil)
      expect(recipe).to be_valid
      # recipe.valid?
      # expect(recipe.errors[:]).to include("must exist")
    end

  end
end