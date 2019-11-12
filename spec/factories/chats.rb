FactoryBot.define do

  factory :chat, class: Chat do
    name              {Faker::Superhero.name}
  end
end