
FactoryBot.define do

  factory :message, class: Message do
    content              {Faker::Quote.famous_last_words}
    url {File.open("#{Rails.root}/public/images/test_image.jpg")}
    user
    chat
  end
end