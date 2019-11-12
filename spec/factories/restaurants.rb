
FactoryBot.define do

  factory :restaurant, class: Restaurant do
    name              {Faker::Superhero.name}
    text              {Faker::Quotes::Shakespeare.romeo_and_juliet_quote}
    lunch_price_id     {1}
    dinner_price_id     {1}
    review             {1}
    vegan_friendly_id    {1}
    visited_time            {Faker::Quotes::Shakespeare.romeo_and_juliet_quote}
    url {File.open("#{Rails.root}/public/images/test_image.jpg")}
    user
    genres_restaurants {[
      FactoryBot.build(:genres_restaurant, restaurant: nil)
    ]}
  end
end