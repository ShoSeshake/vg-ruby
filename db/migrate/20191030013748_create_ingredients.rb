class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string     :name,        null: false,   index: true
      t.string     :ancestry,    null: false,   index: true
      t.timestamps
    end
  end
end
