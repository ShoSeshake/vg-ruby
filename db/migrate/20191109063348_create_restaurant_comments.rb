class CreateRestaurantComments < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_comments do |t|
      t.string      :title,         null: false,    index: true
      t.text        :text,          null: false
      t.integer     :review,        null: false
      t.string      :visited_time,  null: false
      t.references  :user,          null: false,    foreign_key: true
      t.references  :restaurant,    null: false,    foreign_key: true
      t.timestamps
    end
  end
end
