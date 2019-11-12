FactoryBot.define do

  factory :genre, class: Gnere do
    genre              {Faker::Games::Pokemon.name}
  end
end