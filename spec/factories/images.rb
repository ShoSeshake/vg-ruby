FactoryBot.define do

  factory :image, class: Image do
    url {File.open("#{Rails.root}/public/images/test_image.jpg")}
    recipe
  end
end