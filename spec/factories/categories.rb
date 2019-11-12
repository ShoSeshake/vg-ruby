FactoryBot.define do

  factory :category, class: Category do
    name              {Faker::Movies::HarryPotter.spell}
  end
end