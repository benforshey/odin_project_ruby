# BASIC ENUMERABLE METHODS
# Enumerables are a set of convenient built-in methods in Ruby that are included as part of both arrays and hashes. There are some iteration patterns that you’ll find yourself doing again and again, such as transforming, searching for, and selecting subsets of elements in your collections. Enumerables were designed to make implementing these iteration patterns (and therefore your life as a developer) much, much easier.

# Life Before Enumerables
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

# #do is optional in Ruby?
for friend in friends do
  if friend != 'Brian'
    invited_list.push(friend)
  end
end

p invited_list

# The #select Method
p friends.select { |friend| friend != 'Brian' }
# #reject
p friends.reject { |friend| friend == 'Brian' }
# Just a quick rant about Ruby: I love a language that has both #select and #reject. No kidding, I think I'd love to be a Rubyist.

# The #each Method
# `friend` is known as the block variable.
friends.each { |friend| puts "Hello, #{friend}!" }

# What if the block you want to pass to a method requires more logic than can fit on one line? It starts to become less readable and looks unwieldy. For multi-line blocks, the commonly accepted best practice is to change up the syntax to use do...end instead of {...}:
my_array = [1, 2]

my_array.each do |num|
  num *= 2
  puts "The new number is #{num}."
end

# #each also works for hashes with a bit of added functionality. By default, each iteration will yield both the key and value individually or together (as an array) to the block depending on how you define your block variable:
my_hash = { "one" => 1, "two" => 2 }

my_hash.each { |key, value| puts "#{key} is #{value}" }
my_hash.each { |pair| puts "the pair is #{pair}" }

# Also, for/in works for hashes with the same rules for defining block variables:
for k, v in my_hash do
  p k, v
end

# #each returns the original array or hash regardless of what happens inside the code block. This is an important thing to keep in mind when debugging your code as it can lead to some confusion. This is expected, though--like `.forEach()` in JS.
p friends.each { |friend| friend.upcase }

# The #each_with_index Method
# Yields two block variables instead of one as it iterates through an array. The first variable’s value is the element itself, while the second variable’s value is the index of that element within the array.
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even? }

# The #map Method (Also Called #collect)
# Like in other languages, #map returns a value.
p friends.map { |friend| friend.upcase }

my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']
p my_order.map { |item| item.gsub('medium', 'extra large') }
p my_order.collect { |item| item.gsub('medium', 'extra large') }

# Methods can be chained even with passed block.
salaries = [1200, 1500, 1100, 1800]
p salaries.map { |salary| salary - 700 }.sort

responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
p responses.select { |person, response| response == 'yes' }

# The #reduce Method (Also Called #inject)
# It takes an array or hash and reduces it down to a single object. You should use #reduce when you want to get an output of a single value.
my_numbers = [5, 6, 7, 8]
p my_numbers.reduce { |sum, number| sum + number }
# #reduce also allows you to set the accumulator:
p my_numbers.reduce(10) { |sum, number| sum + number }

# The power of reduce:
votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

# Has.new(0) is pretty clever. Without the int 0 parameter, it errors (nil += 1).
votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end

# When we pass in an argument to Hash.new, that becomes the default value when accessing keys that do not exist in the hash.
# Oh my gosh, Ruby...where have you been all my life?
points_balance = Hash.new(100)
points_balance["Ben"] -= 10
points_balance["Susi"] += 6
points_balance["Violet"] += 8
p points_balance["Grace"]
# Predictably, simply accessing a new value does not instantiate it for the object (remove `p` from Grace's to see).
p points_balance

# Bang Methods
# Bang methods can be easily identified by their exclamation marks (!) at the end of their name. All bang methods are destructive and modify the object they are called on. Many of the enumerable methods that return new versions of the array or hash they were called on have a bang method version available, such as #map! and #select!.
# I mean...I can't really see a reason to use these?

# Return Values of Enumerables
# Goodly:
def everybody_but_brian(friends)
  friends.reject { |friend| friend == "Brian" }
end
p everybody_but_brian friends

# Symbol / Proc
# RuboCop taught me this in the RSpec tests: (&:abs)
p my_numbers.map(&:abs)
# &:abs is a shorthand syntax that converts the symbol :abs into a proc that calls the abs method on each object

# Enumerables Block Variables
# For Array: |item| is item at index.
# For Hash: |k,v| is default.
