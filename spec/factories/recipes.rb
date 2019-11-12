FactoryBot.define do

  factory :chat, class: Chat do
    name              {Faker::Superhero.name}
    serving            {round(10)}
    note                {Faker::Music.band}
    user
  end
end