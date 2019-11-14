class Chat < ApplicationRecord
  has_many :chat_members, dependent: :destroy
  has_many :users, through: :chat_members

  has_many :messages, dependent: :destroy
  
  accepts_nested_attributes_for :chat_members, allow_destroy: true
  validates :name, presence: true
  validates :chat_members, length: {minimum: 2}
  
  def show_last_message
    if (last_message = messages.last).present?
      last_message.content? ? last_message.content : 'Image has sent.'
    else
      'No messages'
    end
  end
end
