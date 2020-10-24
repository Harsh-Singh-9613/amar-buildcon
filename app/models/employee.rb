class Employee < ActiveRecord::Base
  has_many :attendances
end