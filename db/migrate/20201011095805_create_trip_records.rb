class CreateTripRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_records do |t|
      t.date :trip_date
      t.integer :trip_count
      t.integer :distance
      t.integer :revenue
      t.integer :truck_capacity
      t.integer :diesel_quatity
      t.integer :diesel_price
      t.string :chainage
      t.references :site

      t.timestamps null: false
    end
  end
end
