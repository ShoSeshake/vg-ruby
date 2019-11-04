class Instruction < ApplicationRecord
  belongs_to :recipe
  validates :text, presence: true
end
