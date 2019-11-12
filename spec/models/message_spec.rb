require 'rails_helper'
describe Message do
  describe '#create' do
    it "is valid with a content, url" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is valid with a content, without an url" do
      message = build(:message, url: nil)
      expect(message).to be_valid
    end

    it "is valid with an url, without a content" do
      message = build(:message, content: nil)
      expect(message).to be_valid
    end

    it "is invalid without a, url nor a content" do
      message = build(:message, content: nil, url: nil)
      message.valid?
      expect(message.errors[:content]).to include("can't be blank")
    end

    it "is invalid without a user" do
      message = build(:message, user: nil)
      message.valid?
      expect(message.errors[:user]).to include("must exist")
    end

    it "is invalid without a chat" do
      message = build(:message, chat: nil)
      message.valid?
      expect(message.errors[:chat]).to include("must exist")
    end
  end
end