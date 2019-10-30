class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string     :name,    null: false, index: true
      t.string     :serving, null: false
      t.text       :text,    null: false
      t.references :user,    null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
