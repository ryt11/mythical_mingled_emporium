class ReplaceContentsWithCreatures < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :contents
  end
end
