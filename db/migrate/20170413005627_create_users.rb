class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :password_confirmation
      t.integer :role, default: 0

      t.timestamps null: false
    end
  end
end
