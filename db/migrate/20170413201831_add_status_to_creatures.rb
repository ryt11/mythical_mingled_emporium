class AddStatusToCreatures < ActiveRecord::Migration[5.0]
  def change
    add_column :creatures, :status, :integer, default: 0
  end
end
