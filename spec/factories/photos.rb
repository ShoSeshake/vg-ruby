FactoryBot.define do

  factory :photo, class: Photo do
    url {File.open("#{Rails.root}/public/images/test_image.jpg")}
    restaurant
  end
end