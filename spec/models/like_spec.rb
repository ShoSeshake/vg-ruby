require 'rails_helper'
describe Like do
  describe '#create' do
    it "is valid with a recipe, user" do
      like = build(:like)
      expect(like).to be_valid
    end
    it "is invalid without a user" do
      like = build(:like, user: nil)
      like.valid?
      expect(like.errors[:user]).to include("must exist")
    end

    it "is invalid without a recipe" do
      like = build(:like, recipe: nil)
      like.valid?
      expect(like.errors[:recipe]).to include("must exist")
    end
  end
end