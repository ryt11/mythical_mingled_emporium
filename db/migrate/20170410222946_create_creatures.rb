class CreateCreatures < ActiveRecord::Migration[5.0]
  def change
    create_table :creatures do |t|
      t.string :breed
      t.text :description
      t.money :price
      t.string :image_url

      t.timestamps null: false
    end
  end
end
