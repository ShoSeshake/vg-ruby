class Photo < ApplicationRecord
  belongs_to :restaurant
  mount_uploader :url, ImageUploader

  validates :url, presence: true
end
