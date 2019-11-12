require 'rails_helper'
describe Chat do
  describe '#create' do
    it "is valid with a name, 2 chat_members" do
      chat = build(:chat)
      expect(chat).to be_valid
    end

    it "is invalid without a name" do
      chat = build(:chat, name: nil)
      chat.valid?
      expect(chat.errors[:name]).to include("can't be blank")
    end

    it "is invalid without 2 chat_members" do
      chat = build(:chat, chat_members: [])
      # expect(chat).to be_valid
      chat.valid?
      expect(chat.errors[:chat_members]).to include("is too short (minimum is 2 characters)")
    end

    it "is invalid without 2 chat_members" do
      chat = build(:chat, chat_members: [FactoryBot.build(:chat_member, chat: nil)])
      chat.valid?
      expect(chat.errors[:chat_members]).to include("is too short (minimum is 2 characters)")
    end
  end
end