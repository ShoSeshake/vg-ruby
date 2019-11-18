require 'rails_helper'
describe Photo do
  describe '#create' do
    it "is valid with an url" do
      photo = build(:photo)
      expect(photo).to be_valid
    end

    it "is valid without an url" do
      photo = build(:photo, url: nil)
      photo.valid?
      expect(photo.errors[:url]).to include("can't be blank")
    end

    it "is invalid without a restaurant" do
      photo = build(:photo, restaurant: nil)
      photo.valid?
      expect(photo.errors[:restaurant]).to include("must exist")
    end
  end
end