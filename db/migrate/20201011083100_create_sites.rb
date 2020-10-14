class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.integer :default_truck_capacity
      t.integer :lnt_basic_charge
      t.string :lnt_leading_charge
      t.integer :excavation_charges

      t.timestamps null: false
    end
  end
end
