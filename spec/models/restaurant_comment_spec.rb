# class RestaurantComment < ApplicationRecord
#   belongs_to :user
#   belongs_to :restaurant_comment

#   validates :title, :text, :review, :visited_time, presence: :true
# end

require 'rails_helper'
describe RestaurantComment do
  describe '#create' do
    it "is valid with a title, text, review, visited_time, vegan_friendly_id, :url" do
      restaurant_comment = build(:restaurant_comment)
      expect(restaurant_comment).to be_valid
    end

    it "is invalid without a title" do
      restaurant_comment = build(:restaurant_comment, title: nil)
      restaurant_comment.valid?
      expect(restaurant_comment.errors[:title]).to include("can't be blank")
    end

    it "is invalid without a user" do
      restaurant_comment = build(:restaurant_comment, user: nil)
      restaurant_comment.valid?
      expect(restaurant_comment.errors[:user]).to include("must exist")
    end

    it "is invalid without a restaurant" do
      restaurant_comment = build(:restaurant_comment, restaurant: nil)
      restaurant_comment.valid?
      expect(restaurant_comment.errors[:restaurant]).to include("must exist")
    end

    it "is invalid without a text" do
      restaurant_comment = build(:restaurant_comment, text: nil)
      restaurant_comment.valid?
      expect(restaurant_comment.errors[:text]).to include("can't be blank")
    end

    it "is invalid without a review" do
      restaurant_comment = build(:restaurant_comment, review: nil)
      restaurant_comment.valid?
      expect(restaurant_comment.errors[:review]).to include("can't be blank")
    end

    it "is invalid without a visited_time" do
      restaurant_comment = build(:restaurant_comment, visited_time: nil)
      restaurant_comment.valid?
      expect(restaurant_comment.errors[:visited_time]).to include("can't be blank")
    end
  end
end