
FactoryBot.define do

  factory :genre, class: Genre do
    genre              {Faker::Games::Pokemon.name}
  end
end