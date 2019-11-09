class CreateInstructions < ActiveRecord::Migration[5.2]
  def change
    create_table :instructions do |t|
      t.text       :text,       null: false
      t.integer    :position,   null: false
      t.references :recipe,     null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
