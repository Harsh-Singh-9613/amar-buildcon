class Employee < ActiveRecord::Base

  has_many :attendances

  validates_presence_of :name, :license_number, :adhaar_number, :mobile_number, :salary, :designation

  validates :adhaar_number, length: { is: 12 }
  validates :mobile_number, length: { is: 10 }
  
end