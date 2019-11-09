class RestaurantComment < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  mount_uploader :url, ImageUploader

  validates :title, :text, :review, :visited_time, presence: :true
end
