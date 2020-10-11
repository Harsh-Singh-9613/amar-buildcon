class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.integer :capacity
      t.integer :transport_charges_first_km
      t.string :transport_charges_nexts_km
      t.integer :excavation

      t.timestamps null: false
    end
  end
end
