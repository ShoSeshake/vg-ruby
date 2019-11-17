
FactoryBot.define do

  factory :restaurant, class: Restaurant do
    name              {Faker::Superhero.name}
    text              {Faker::Quotes::Shakespeare.romeo_and_juliet_quote}
    price_id     {1}
    review             {1}
    vegan_friendly_id    {1}
    visited_time            {Faker::Quotes::Shakespeare.romeo_and_juliet_quote}
    user
  end
end