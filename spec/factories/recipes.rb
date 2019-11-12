
FactoryBot.define do

  factory :recipe, class: Recipe do
    name              {Faker::Superhero.name}
    serving            {1}
    note                {Faker::Music.band}
    user
  end
end