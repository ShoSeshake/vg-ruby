class CreateIngredientsRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients_recipes do |t|
      t.string     :quantity,       null: false
      t.references :ingredient,     null: false,   foreign_key: true
      t.references :recipe,         null: false,   foreign_key: true
      t.timestamps
    end
  end
end
