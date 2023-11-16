require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"


# ### Exercise 6: One-to-many association

# We haven't used the Employee class (and employees table) at all yet. If you look at this table's column structure, you'll find that it has a `store_id` (integer) column. This is a column that identifies which store each employee belongs to. It points to the `id` (integer) column of their store.

# Let's tell Active Record that these two tables are in fact related via the `store_id` column.

# 1. Add the following code _directly_ inside the Store model (class): `has_many :employees`
# 2. Add the following code directly inside the Employee model (class): `belongs_to :store`
# 3. Add some data into employees. Here's an example of one (note how it differs from how you create stores): `@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)`
# 4. Go ahead and create some more employees using the create method. You can do this by making multiple calls to create (like you have before.) No need to assign the employees to variables though. Create them through the `@store#` instance variables that you defined in previous exercises. Create a bunch under `@store1` (Burnaby) and `@store2` (Richmond). Eg: `@store1.employees.create(...)`.

@store1 = Store.find(1)
@store2 = Store.find(2)
# @store3 = Store.find(3)
@store4 = Store.find(4)
@store5 = Store.find(5)

@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60) 
@store1.employees.create([
  { first_name: "John", last_name: "Doe", hourly_rate: 50 },
  { first_name: "Jane", last_name: "Smith", hourly_rate: 55 },
  # Add more employees for @store1 as needed
])

@store2.employees.create([
  { first_name: "Alice", last_name: "Johnson", hourly_rate: 60 },
  { first_name: "Bob", last_name: "Anderson", hourly_rate: 45 },
  # Add more employees for @store2 as needed
])

# @store3.employees.create([
#   { first_name: "Eva", last_name: "Parker", hourly_rate: 65 },
#   { first_name: "Michael", last_name: "Clark", hourly_rate: 50 },
#   # Add more employees for @store3 as needed
# ])

@store4.employees.create([
  { first_name: "Sophia", last_name: "Brown", hourly_rate: 55 },
  { first_name: "William", last_name: "White", hourly_rate: 60 },
  # Add more employees for @store4 as needed
])

@store5.employees.create([
  { first_name: "Olivia", last_name: "Garcia", hourly_rate: 70 },
  { first_name: "James", last_name: "Martinez", hourly_rate: 48 },
  # Add more employees for @store5 as needed
])

stores = Store.all

stores.each do |store|
  puts "#{store.name} Employees"
  store.employees.each do |employee|
    puts "#{employee.first_name} #{employee.last_name}" 
  end
end
