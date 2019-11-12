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

    it "is invalid without a url" do
      restaurant = build(:restaurant, url: nil)
      restaurant.valid?
      expect(restaurant.errors[:url]).to include("can't be blank")
    end

    it "is invalid without a visited_time" do
      restaurant = build(:restaurant, visited_time: nil)
      restaurant.valid?
      expect(restaurant.errors[:visited_time]).to include("can't be blank")
    end

    it "is invalid without a genres_restaurant" do
      restaurant = build(:restaurant, genres_restaurants:[])
      restaurant.valid?
      expect(restaurant.errors[:genres_restaurants]).to include("is too short (minimum is 1 character)")
    end
  end
end