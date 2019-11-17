class Restaurant < ApplicationRecord
  belongs_to :user

  has_many :restaurant_comments,   dependent: :destroy
  has_many :photos,                 dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :vegan_friendly
    belongs_to_active_hash :price

  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :name, :gurunavi_id, :text,:location, :price_id,:review, :visited_time, :vegan_friendly_id,presence: :true

  validates :photos, length: {maximum: 10, minimum: 1}
end
