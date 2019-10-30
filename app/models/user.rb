class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

    has_many :comments,   dependent: :destroy
    has_many :recipes,    dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :country


    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
    validates :password, length: { minimum: 7, maximum: 128}
    validates :password_confirmation, length: { minimum: 7, maximum: 128}
    validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :name, :email, :password, :password_confirmation, presence: true

end
