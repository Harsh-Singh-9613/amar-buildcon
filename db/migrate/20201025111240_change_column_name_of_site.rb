class ChangeColumnNameOfSite < ActiveRecord::Migration[6.0]
  def change
    rename_column :sites, :capacity, :default_truck_capacity
    rename_column :sites, :transport_charges_first_km, :lnt_basic_charge
    rename_column :sites, :transport_charges_nexts_km, :lnt_leading_charge
    rename_column :sites, :excavation, :excavation_charges
  end
end
