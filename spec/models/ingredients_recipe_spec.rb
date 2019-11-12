require 'rails_helper'
describe IngredientsRecipe do
  describe '#create' do
    it "is valid with a content, quantity" do
      ingredients_recipe = build(:ingredients_recipe)
      expect(ingredients_recipe).to be_valid
    end

    it "is valid with a content, without an quantity" do
      ingredients_recipe = build(:ingredients_recipe, quantity: nil)
      ingredients_recipe.valid?
      expect(ingredients_recipe.errors[:quantity]).to include("can't be blank")
    end

    it "is invalid without a recipe" do
      ingredients_recipe = build(:ingredients_recipe, recipe: nil)
      ingredients_recipe.valid?
      expect(ingredients_recipe.errors[:recipe]).to include("must exist")
    end

    it "is invalid without a ingredient" do
      ingredients_recipe = build(:ingredients_recipe, ingredient: nil)
      ingredients_recipe.valid?
      expect(ingredients_recipe.errors[:ingredient]).to include("must exist")
    end
  end
end