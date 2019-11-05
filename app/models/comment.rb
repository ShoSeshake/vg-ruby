class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :text, :review, presence: true
end
