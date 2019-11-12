
FactoryBot.define do

  factory :user, class: User do
    name              {Faker::JapaneseMedia::OnePiece.character}
    email                 {Faker::Internet.email}
    password              {"00000000"}
    password_confirmation {"00000000"}
    prefecture_id            {1}
    country_id       {1}
  end
end