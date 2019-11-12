require 'rails_helper'
describe Image do
  describe '#create' do
    it "is valid with a url" do
      image = build(:image)
      expect(image).to be_valid
    end

    it "is valid with a content, without an url" do
      image = build(:image, url: nil)
      image.valid?
      expect(image.errors[:url]).to include("can't be blank")
    end

    it "is invalid without a recipe" do
      image = build(:image, recipe: nil)
      image.valid?
      expect(image.errors[:recipe]).to include("must exist")
    end
  end
end