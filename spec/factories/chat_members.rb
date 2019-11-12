FactoryBot.define do

  factory :chat_member, class: ChatMember do
    chat
    user
  end
end