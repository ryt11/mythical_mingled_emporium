class CreateCreaturesCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :creatures_categories do |t|
      t.references :category, foreign_key: true
      t.references :creature, foreign_key: true
      t.timestamps null: false
    end
  end
end
