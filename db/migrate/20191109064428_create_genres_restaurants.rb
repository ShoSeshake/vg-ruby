class CreateGenresRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :genres_restaurants do |t|
      t.references  :genre,              null: false, foreign_key: true
      t.references  :restaurant,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
