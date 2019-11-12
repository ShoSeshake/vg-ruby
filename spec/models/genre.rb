class Genre < ApplicationRecord
  has_many :genres_restaurants
  has_many :restaurants, through: :genres_restaurants
end
