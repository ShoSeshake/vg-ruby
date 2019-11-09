class Instruction < ApplicationRecord
  belongs_to :recipe
  # acts_as_list scope: :recipe
  validates :text, :position, presence: true
end
