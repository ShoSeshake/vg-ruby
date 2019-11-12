# class Restaurant < ApplicationRecord
#   belongs_to :restaurant
#   mount_uploader :url, ImageUploader

#   has_many :restaurant_comments,   dependent: :destroy
#   has_many :genres_restaurants,    dependent: :destroy
#   has_many :genres, through: :genres_restaurants

#   extend ActiveHash::Associations::ActiveRecordExtensions
#     belongs_to_active_hash :prefecture
#     belongs_to_active_hash :vegan_friendly
#     belongs_to_active_hash :lunch_price
#     belongs_to_active_hash :dinner_price

#   accepts_nested_attributes_for :genres_restaurants, allow_destroy: true

#   validates :name, :text, :review, :visited_time, :vegan_friendly_id, :url,presence: :true

#   validates :genres_restaurants, length: {minimum: 1}
# end
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

    it "is invalid without a user" do
      restaurant = build(:restaurant, user: nil)
      restaurant.valid?
      expect(restaurant.errors[:user]).to include("must exist")
    end
  end
end