class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

    has_many :comments,              dependent: :destroy
    has_many :recipes,               dependent: :destroy
    has_many :likes,                 dependent: :destroy
    has_many :restaurants,           dependent: :destroy
    has_many :restaurant_comments,   dependent: :destroy
    has_many :messages,              dependent: :destroy

    has_many :chat_members,          dependent: :destroy
    has_many :chats, through: :chat_members

    has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
    has_many :followings, through: :following_relationships
  
    has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
    has_many :followers, through: :follower_relationships
  
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :country
    
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :password, length: { minimum: 7, maximum: 128}
    validates :password_confirmation, length: { minimum: 7, maximum: 128}
    validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :name, :email, :password, :password_confirmation, presence: true
    
    def following?(other_user)
      following_relationships.find_by(following_id: other_user.id)
    end
  
    def follow!(other_user)
      following_relationships.create!(following_id: other_user.id)
    end
  
    def unfollow!(other_user)
      following_relationships.find_by(following_id: other_user.id).destroy
    end
end
