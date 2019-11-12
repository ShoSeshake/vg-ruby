FactoryBot.define do

  factory :chat, class: Chat do
    name              {Faker::Superhero.name}
    text              {Faker::Quotes::Shakespeare.romeo_and_juliet_quote}
    lunch_price_id     {round(5)}
    dinner_price_id     {round(5)}
    review             {round(10)}
    url {File.open("#{Rails.root}/public/images/test_image.jpg")}
  end
end