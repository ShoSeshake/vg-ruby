FactoryBot.define do

  factory :ingredient, class: Ingredient do
    name              {Faker::Food.vegetables}
  end
end