
FactoryBot.define do

  factory :ingredients_recipe, class: IngredientsRecipe do
    quantity              {Faker::Games::Pokemon.move}
    ingredient
    recipe
  end
end