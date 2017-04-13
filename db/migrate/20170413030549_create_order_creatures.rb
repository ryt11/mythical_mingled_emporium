class CreateOrderCreatures < ActiveRecord::Migration[5.0]
  def change
    create_table :order_creatures do |t|
      t.integer :quantity
      t.references :creature, foreign_key: true
      t.references :order, foreign_key: true
    end
  end
end
