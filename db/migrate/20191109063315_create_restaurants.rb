class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string      :name,          null: false, index: true
      t.text        :text,          null: false
      t.integer      :lunch_price_id
      t.integer      :dinner_price_id
      t.integer     :review,         null: false
      t.string      :visited_time,   null: false
      t.string      :url
      t.string      :hp
      t.string      :address
      t.string      :telephone
      t.integer     :vegan_friendly_id,   null: false
      t.integer     :prefecture_id
      t.references  :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
