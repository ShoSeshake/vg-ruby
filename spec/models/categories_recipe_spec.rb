require 'rails_helper'
describe CategoriesRecipe do
  describe '#create' do
    it "is valid with a category, recipe" do
      categories_recipe = build(:categories_recipe)
      expect(categories_recipe).to be_valid
    end

    it "is invalid without a category" do
      categories_recipe = build(:categories_recipe, category: nil)
      categories_recipe.valid?
      expect(categories_recipe.errors[:category]).to include("must exist")
    end

    it "is invalid without a recipe" do
      categories_recipe = build(:categories_recipe, recipe: nil)
      categories_recipe.valid?
      expect(categories_recipe.errors[:recipe]).to include("must exist")
    end
  end
end