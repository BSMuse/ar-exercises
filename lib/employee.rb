# - Employees must always have a first name present
# - Employees must always have a last name present
# - Employees have a hourly_rate that is a number (integer) between 40 and 200
# - Employees must always have a store that they belong to (can't have an employee that is not assigned a store)

class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, comparison: { less_than: :200 }
  validates :hourly_rate, comparison: { greater_than: :40 }
  validates :store, presence: true
end 
