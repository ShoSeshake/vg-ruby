require 'rails_helper'
describe Restaurant do
  describe '#create' do
    it "is valid with a name, text, review.:visited_time, vegan_friendly_id, :url" do
      restaurant = build(:restaurant)
      expect(restaurant).to be_valid
    end

    it "is invalid without a name" do
      restaurant = build(:restaurant, name: nil)
      restaurant.valid?
      expect(restaurant.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a user" do
      restaurant = build(:restaurant, user: nil)
      restaurant.valid?
      expect(restaurant.errors[:user]).to include("must exist")
    end

    it "is invalid without a text" do
      restaurant = build(:restaurant, text: nil)
      restaurant.valid?
      expect(restaurant.errors[:text]).to include("can't be blank")
    end

    it "is invalid without a review" do
      restaurant = build(:restaurant, review: nil)
      restaurant.valid?
      expect(restaurant.errors[:review]).to include("can't be blank")
    end

    it "is invalid without a vegan_friendly_id" do
      restaurant = build(:restaurant, vegan_friendly_id: nil)
      restaurant.valid?
      expect(restaurant.errors[:vegan_friendly_id]).to include("can't be blank")
    end

    it "is invalid without a location" do
      restaurant = build(:restaurant, location: nil)
      restaurant.valid?
      expect(restaurant.errors[:location]).to include("can't be blank")
    end

    it "is invalid without a price_id" do
      restaurant = build(:restaurant, price_id: nil)
      restaurant.valid?
      expect(restaurant.errors[:price_id]).to include("can't be blank")
    end

    it "is invalid without a photo" do
      restaurant = build(:restaurant, photos: [])
      restaurant.valid?
      expect(restaurant.errors[:photos]).to include("is too short (minimum is 1 character)")
    end

    it "is invalid without a visited_time" do
      restaurant = build(:restaurant, visited_time: nil)
      restaurant.valid?
      expect(restaurant.errors[:visited_time]).to include("can't be blank")
    end
  end
end