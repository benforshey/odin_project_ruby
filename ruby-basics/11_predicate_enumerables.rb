# PREDICATE ENUMERABLES
# A predicate method is indicated by a question mark (?) at the end of the method name and returns either true or false.
# #include?
numbers = [5, 6, 7, 8, 21, 42, 303, 499, 550, 811]

p numbers.include?(6)
p numbers.include?(3)

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_list = friends.reject { |friend| friend == 'Brian' }

p invited_list.include?('Brian')

# #any?
p numbers.any? { |number| number > 500 }
p numbers.any? { |number| number < 20 }

# #all?
# #all? will return true by default unless the block returns false or nil. So if you call #all? on an empty array or hash (i.e., there are no elements for the block to evaluate), it will return true.
fruits = ["apple", "banana", "strawberry", "pineapple"]

p fruits.all? { |fruit| fruit.length > 3 }
p fruits.all? { |fruit| fruit.length > 6 }

# #none?
p fruits.none? { |fruit| fruit.length > 10 }
p fruits.none? { |fruit| fruit.length > 6 }

# #one?
p numbers.one? { |n| n == 811 }
