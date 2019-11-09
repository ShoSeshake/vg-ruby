class Instruction < ApplicationRecord
  belongs_to :recipe
  validates :text, :position, presence: true
end
