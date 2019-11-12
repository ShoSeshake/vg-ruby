
FactoryBot.define do

  factory :recipe, class: Recipe do
    name              {Faker::Superhero.name}
    serving            {1}
    text                {Faker::Music.band}
    user
    images {[
      FactoryBot.build(:image, recipe: nil)
    ]}
    instructions {[
      FactoryBot.build(:instruction, recipe: nil)
    ]}
    categories_recipes {[
      FactoryBot.build(:categories_recipe, recipe: nil)
    ]}
    ingredients_recipes {[
      FactoryBot.build(:ingredients_recipe, recipe: nil)
    ]}
  end
end