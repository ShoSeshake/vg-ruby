class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string      :url,     null: false
      t.references  :recipe,  null: false,  foreign_key: true
      t.timestamps
    end
  end
end