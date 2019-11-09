class Restaurant < ApplicationRecord
  belongs_to :user

  has_many :restaurant_comments,   dependent: :destroy

  has_many :genres_restaurants
  has_many :genres, through: :genres_restaurants

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :vegan_friendly

    accepts_nested_attributes_for :genres_restaurants, allow_destroy: true

    validates :name, :text, :review, :visited_time, :vegan_friendly_id, presence: :true

    validates :genre_restaurants, length: {minimum: 1}
end
