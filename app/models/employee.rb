class Employee < ActiveRecord::Base

  has_many :attendances
  belongs_to :site

  validates_presence_of :name, :license_number, :mobile_number, :salary, :designation

  # validates :mobile_number, length: { is: 10 }
  
end