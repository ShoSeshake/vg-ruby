class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates :content, presence: true, unless: :url?
  mount_uploader :url, ImageUploader
end
