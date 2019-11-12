
FactoryBot.define do

  factory :restaurant, class: Restaurant do
    name              {Faker::Superhero.name}
    text              {Faker::Quotes::Shakespeare.romeo_and_juliet_quote}
    lunch_price_id     {1}
    dinner_price_id     {1}
    review             {1}
    url {File.open("#{Rails.root}/public/images/test_image.jpg")}
  end
end