class Chat < ApplicationRecord
  has_many :chat_members
  has_many :users, through: :chat_members

  has_many :messages, dependent: :destroy
  
  accepts_nested_attributes_for :chat_members, allow_destroy: true
  validates :name, presence: true
end
