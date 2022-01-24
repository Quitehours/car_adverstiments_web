class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :make, null: false
      t.string :model, null: false
      t.integer :year, null: false
      t.integer :odometer, null: false
      t.float :price, null: false, scale: 2
      t.text :description, limit: 1000
      t.timestamps
    end

    add_index :cars, %i[make model price]
  end
end
