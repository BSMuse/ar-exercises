require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ... 

# 1. Borrowing and modifying the code from Exercise one, create 3 more stores:

# - Surrey (annual_revenue of 224000, carries women's apparel only)
# - Whistler (annual_revenue of 1900000 carries men's apparel only)
# - Yaletown (annual_revenue of 430000 carries men's and women's apparel)

# 2. Using the `where` class method from Active Record, fetch (a collection of) only those stores that carry men's apparel. Assign the results to a variable `@mens_stores`.
# 3. Loop through each of these stores and output their name and annual revenue on each line.
# 4. Do another fetch but this time load stores that carry women's apparel and are generating less than $1M in annual revenue

Store.create([
  { name: 'Surrey', annual_revenue: 2240000, womens_apparel: true },
  { name: 'Whistler', annual_revenue: 190000, mens_apparel: true },
  { name: 'Yaletown', annual_revenue: 430000, mens_apparel: true, womens_apparel: true }
]) 

@mens_stores = Store.where(mens_apparel: true) 
@women_stores = Store.where(womens_apparel: true).where('annual_revenue < ?', 1000000)

puts "Men's Stores:"
@mens_stores.each do |store|
  puts "Name: #{store.name}, Annual Revenue: #{store.annual_revenue}"
end 

puts "\nWomen's Stores Generating Less than $1M in Annual Revenue:"
@women_stores.each do |store|
  puts "Name: #{store.name}, Annual Revenue: #{store.annual_revenue}"
end




