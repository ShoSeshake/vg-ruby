
FactoryBot.define do

  factory :restaurant_comment, class: RestaurantComment do
    title              {Faker::Superhero.name}
    text                {Faker::Quotes::Shakespeare.as_you_like_it_quote}
    review              {1}
    visited_time       {Faker::Games::Pokemon.name}
    user
    restaurant
  end
end