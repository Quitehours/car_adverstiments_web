class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :make, null: true
      t.string :model, null: true
      t.string :year_from, null: true
      t.string :year_to, null: true
      t.string :price_from, null: true
      t.string :price_to, null: true
      t.timestamps
    end
  end
end
