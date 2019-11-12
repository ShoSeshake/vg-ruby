require 'rails_helper'
describe Comment do
  describe '#create' do
    it "is valid with a text, review" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "is valid with a content, without a text" do
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("can't be blank")
    end

    it "is valid with a content, without a review" do
      comment = build(:comment, review: nil)
      comment.valid?
      expect(comment.errors[:review]).to include("can't be blank")
    end

    it "is invalid without a recipe" do
      comment = build(:comment, recipe: nil)
      comment.valid?
      expect(comment.errors[:recipe]).to include("must exist")
    end

    it "is invalid without a user" do
      comment = build(:comment, user: nil)
      comment.valid?
      expect(comment.errors[:user]).to include("must exist")
    end
  end
end