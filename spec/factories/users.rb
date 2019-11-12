FactoryBot.define do

  factory :user, class: User do
    name              {Faker::JapaneseMedia::OnePiece.character}
    email                 {Faker::Internet.email}
    password              {"00000000"}
    password_confirmation {"00000000"}
    prefecture_id            {round(47)}
    country_id       {round(200)}
  end
end