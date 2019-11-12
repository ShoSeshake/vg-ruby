
FactoryBot.define do

  factory :chat, class: Chat do
    name              {Faker::Superhero.name}
    chat_members {[
      FactoryBot.build(:chat_member, chat: nil),
      FactoryBot.build(:chat_member, chat: nil)
    ]}
  end
end