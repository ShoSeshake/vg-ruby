class Restaurant < ApplicationRecord
  belongs_to :user
  mount_uploader :url, ImageUploader

  has_many :restaurant_comments,   dependent: :destroy

  has_many :genres_restaurants
  has_many :genres, through: :genres_restaurants

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :vegan_friendly
    belongs_to_active_hash :lunch_price
    belongs_to_active_hash :dinner_price

  accepts_nested_attributes_for :genres_restaurants, allow_destroy: true

  validates :name, :text, :review, :visited_time, :vegan_friendly_id, :url,presence: :true

  validates :genres_restaurants, length: {minimum: 1}
end
