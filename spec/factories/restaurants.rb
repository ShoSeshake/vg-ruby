
FactoryBot.define do

  factory :restaurant, class: Restaurant do
    name              {Faker::Superhero.name}
    text              {Faker::Quotes::Shakespeare.romeo_and_juliet_quote}
    gurunavi_id        {Faker::Superhero.name}
    location           {Faker::Movies::HarryPotter.spell}
    price_id     {1}
    review             {1}
    vegan_friendly_id    {1}
    visited_time            {Faker::Quotes::Shakespeare.romeo_and_juliet_quote}
    user
    photos {[
      FactoryBot.build(:photo, restaurant: nil)
    ]}
  end
end