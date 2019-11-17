class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string      :name,           null: false, index: true
      t.string      :gurunavi_id,   null:  false
      t.text        :text,           null: false
      t.string     :location,      null: false
      t.integer     :price_id,       null: false
      t.integer     :review,         null: false
      t.string      :visited_time,   null: false
      t.integer     :vegan_friendly_id,   null: false
      t.references  :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
