# README
* Ruby version
    2.5.1

* Database creation

## categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false,index:true|
|ancestry|string|null:false,index:true|

### Association
-  has_many :categories_recipes
-  has_many :recipes, through: :categories_recipes

## categories_recipes table
|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, foreignkey:true|
|recipe_id|references|null: false, foreignkey:true|

### Association
-  belongs_to :recipe
-  belongs_to :category


## chat_members table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreignkey:true|
|chat_id|references|null: false, foreignkey:true|

### Association
-  belongs_to :chat
-  belongs_to :user


## chats table 
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|


### Association
-  has_many :chat_members
-  has_many :users, through: :chat_members
-  has_many :messages, dependent: :destroy


## comment table
|Column|Type|Options|
|------|----|-------|
|text|text|null:false|
|review|integer|null:false|
|recipe_id|references|null: false, foreignkey:true|
|user_id|references|null: false, foreignkey:true|

### Association
-  belongs_to :recipe
-  belongs_to :user



## images table
|Column|Type|Options|
|------|----|-------|
|url|string|null:false|
|recipe_id|references|null: false, foreignkey:true|

### Association
-  belongs_to :recipe


## ingredients table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false,index:true|
|ancestry|string|index:true|

### Association
-  has_many :ingredients_recipes
-  has_many :recipes, through: :ingredients_recipes

## ingredients_recipes table
|Column|Type|Options|
|------|----|-------|
|qunatity|string|null:false|
|recipe_id|references|null: false, foreignkey:true|
|ingredient_id|references|null: false, foreignkey:true|

### Association
-  belongs_to :recipe
-  belongs_to :ingredient

## instructions table
|Column|Type|Options|
|------|----|-------|
|text|text|null:false|
|review|integer|null:false|
|recipe_id|references|null: false, foreignkey:true|

### Associatio-n
belongs_to :recipe


## likes table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreignkey:true|
|recipe_id|references|null: false, foreignkey:true|

### Association
-  belongs_to :recipe
-  belongs_to :user


## messages table
|Column|Type|Options|
|------|----|-------|
|text|string||
|url|string||
|chat_id|references|null: false, foreignkey:true|
|user_id|references|null: false, foreignkey:true|

### Association
-  belongs_to :user
-  belongs_to :chat


## photos table
|Column|Type|Options|
|------|----|-------|
|url|string|null:false|
|restaurant_id|references|null: false, foreignkey:true|

### Association
-  belongs_to :restaurant


## recipes table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false,index:true|
|serving|text|null:false|
|user_id|references|null: false, foreignkey:true|

### Association
-  belongs_to :user
-  has_many :comments,          dependent: :destroy
-  has_many :images,            dependent: :destroy
-  has_many :instructions,      dependent: :destroy
-  has_many :likes,             dependent: :destroy
-  has_many :ingredients_recipes
-  has_many :ingredients, through: :ingredients_recipes
-  has_many :categories_recipes
-  has_many :categories, through: :categories_recipes


## relationships table
|Column|Type|Options|
|------|----|-------|
|follower_id|integer||
|following_id|integer||

### Association
-  belongs_to :follower, class_name: "User"
-  belongs_to :following, class_name: "User"


## restaurants_comments table
|Column|Type|Options|
|------|----|-------|
|title|string|null:false|
|text|tetx|null:false|
|visited_time|string|null:false|
|restaurant_id|references|null: false, foreignkey:true|
|user_id|references|null: false, foreignkey:true|

### Association
-  belongs_to :user
-  belongs_to :restaurant

## restaurants table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false,index:true|
|text|text|null:false|
|price_id|integer||
|review|integer|null:false|
|visited_time|string|null:false|
|location|string||
|gurunavi_id|string||
|vegan_friendly_id|integer|null:false|
|user_id|references|null: false, foreignkey:true|

### Association
-  belongs_to :user

-  has_many :restaurant_comments,   dependent: :destroy
-  has_many :photos,    dependent: :destroy


## users table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false,index:true|
|prefecture_id|integer||
|country_id|integer||
|email|string|null:false|
|password|string|null:false|
|password_confirmation|string|null:false|

### Association
-  has_many :comments,              dependent: :destroy
-  has_many :recipes,               dependent: :destroy
-  has_many :likes,                 dependent: :destroy
-  has_many :restaurants,           dependent: :destroy
-  has_many :restaurant_comments,   dependent: :destroy
-  has_many :messages,              dependent: :destroy

-  has_many :chat_members,          dependent: :destroy
-  has_many :chats, through: :chat_members

-  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
-  has_many :followings, through: :following_relationships
  
-  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
-  has_many :followers, through: :follower_relationships