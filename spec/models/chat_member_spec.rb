require 'rails_helper'
describe ChatMember do
  describe '#create' do
    it "is valid with a chat, user" do
      chat_member = build(:chat_member)
      expect(chat_member).to be_valid
    end

    it "is invalid without a chat" do
      chat_member = build(:chat_member, chat: nil)
      chat_member.valid?
      expect(chat_member.errors[:chat]).to include("must exist")
    end

    it "is invalid without a user" do
      chat_member = build(:chat_member, user: nil)
      chat_member.valid?
      expect(chat_member.errors[:user]).to include("must exist")
    end
  end
end