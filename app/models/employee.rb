class Employee < ActiveRecord::Base

  has_many :attendances

  validates_presence_of :name, :license_number, :mobile_number, :salary, :designation

  validates :mobile_number, length: { is: 10 }
  
end