require 'rails_helper'
describe GenresRestaurant do
  describe '#create' do
    it "is valid with a genre, restaurant" do
      genres_restaurant = build(:genres_restaurant)
      expect(genres_restaurant).to be_valid
    end

    it "is invalid without a genre" do
      genres_restaurant = build(:genres_restaurant, genre: nil)
      genres_restaurant.valid?
      expect(genres_restaurant.errors[:genre]).to include("must exist")
    end

    it "is invalid without a restaurant" do
      genres_restaurant = build(:genres_restaurant, restaurant: nil)
      genres_restaurant.valid?
      expect(genres_restaurant.errors[:restaurant]).to include("must exist")
    end
  end
end