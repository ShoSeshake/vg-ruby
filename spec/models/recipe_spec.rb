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

    it "is invalid without a image" do
      recipe = build(:recipe, images:[])
      recipe.valid?
      expect(recipe.errors[:images]).to include("is too short (minimum is 1 character)")
    end

    it "is invalid without a instruction" do
      recipe = build(:recipe, instructions:[])
      recipe.valid?
      expect(recipe.errors[:instructions]).to include("is too short (minimum is 1 character)")
    end
    it "is invalid without a categories_recipe" do
      recipe = build(:recipe, categories_recipes:[])
      recipe.valid?
      expect(recipe.errors[:categories_recipes]).to include("is too short (minimum is 1 character)")
    end
    it "is invalid without a ingredients_recipe" do
      recipe = build(:recipe, ingredients_recipes:[])
      recipe.valid?
      expect(recipe.errors[:ingredients_recipes]).to include("is too short (minimum is 1 character)")
    end
  end
end