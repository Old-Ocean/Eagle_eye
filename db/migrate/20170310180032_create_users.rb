class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :mail
      t.string :name
      t.string :favorite
      t.integer :user_id

      t.timestamps
    end
  end
end
