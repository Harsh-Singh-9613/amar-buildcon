class Site < ActiveRecord::Base
  has_many :trip_records

  validates_presence_of :name, :default_truck_capacity, :lnt_basic_charge, :lnt_leading_charge, :excavation_charges
end
