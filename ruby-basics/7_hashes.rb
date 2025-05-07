# DOCS: https://launchschool.com/books/ruby/read/hashes
# HASHES
#
# Like many other languages, Ruby uses "keys" and "values" for hashes.
# Also like many other languages, the value of this structure isn't in it's ordering, it's in the fact that you have a value accessible at a name.
# Since Ruby 1.9, hashes maintain their order, though.

# Keys and values are associated with a special operator called a hash rocket: =>. E.g., {"foo" => "bar"}
# Has created with hash literal.
my_hash = {
  "a random word" => "ahoy",
  "Dorothy's math test score" => 94,
  "an array" => [1, 2, 3],
  "an empty hash within a hash" => {}
}
p my_hash

# Like other languages, property access is done through bracket literal.
p my_hash["a random word"]
# If you try to access a key that doesn’t exist in the hash, it will return nil:
p my_hash["not_there"]
# Sometimes, this behavior can be problematic for you if silently returning a nil value could potentially wreak havoc in your program. Luckily, hashes have a fetch method that will raise an error when you try to access a key that is not in your hash. Like Python, you can supply a fallback value.
p my_hash.fetch("not_there", "fallback_value")

# Hashes can be created from the object...
my_hash = Hash.new
p my_hash

# Adding and Changing Data
shoes = Hash.new

# You can add a new key or update an existing key with this syntax.
shoes["beach"] = "flip flops"
shoes["fall"] = "sneakers"
# Like other languages, you cannot create nested hashes implicitly.
# shoes["dress"]["formal"] = "oxford"
p shoes

# Removing Data
# Does not raise an error.
shoes.delete("not a key")
shoes.delete("beach")
p shoes

# Methods
p Hash.new.methods

books = {
  "Infinite Jest" => "David Foster Wallace",
  "Into the Wild" => "Jon Krakauer"
}

p books.keys
p books.values

# Merging Hashes
# Non-mutative merge. "books" would overwrite "shoes" where key names conflict.
p shoes.merge(books)
p shoes
p books

# Complete Aside, But Related to Mutative Operations
# Regarding mutating values, try variable_you_are_interested_in.object_id; #object_id shows the address in memory.
p books.object_id

# Symbols as Hash Keys
# "In the real world, you’ll almost always see symbols (like :this_guy) used as keys. This is predominantly because symbols are far more performant than strings in Ruby, but they also allow for a much cleaner syntax when defining hashes."
# 'Rocket' syntax
american_cars = {
  :chevrolet => "Corvette",
  :ford => "Mustang",
  :dodge => "Ram"
}
# 'Symbols' syntax
# This only works for symbols, so { 4: "value" } won't work.
japanese_cars = {
  honda: "Accord",
  toyota: "Corolla",
  nissan: "Altima"
}

p american_cars
p japanese_cars

# When you use the cleaner ‘symbols’ syntax to create a hash, you’ll still need to use the standard symbol syntax when you’re trying to access a value. In other words, regardless of which of the above two syntax options you use when creating a hash, they both create symbol keys that are accessed the same way.
p american_cars[:ford]
p japanese_cars[:honda]

# Iterating Over Hashes
person = { name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown' }

person.each do |key, value|
  puts "Bob's #{key} is #{value}"
end

# Hashes as Optional Parameters
def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]}" +
         " years old and I live in #{options[:city]}."
  end
end

greeting("Bob")
greeting("Bob", { age: 62, city: "New York City" })

# Kinda like Python, you can treat positional arguments as keyword arguments.
greeting("Bob", age: 62, city: "New York City")

# Hashes vs Arrays
# Common to many langues, but when deciding whether to use a hash or an array, ask yourself a few questions:
# - Does this data need to be associated with a specific label? If yes, use a hash. If the data doesn't have a natural label, then typically an array will work fine.
# - Does order matter? If yes, then use an array. As of Ruby 1.9, hashes also maintain order, but usually ordered items are stored in an array.
# - Do I need a "stack" or a "queue" structure? Arrays are good at mimicking simple "first-in-first-out" queues, or "last-in-first-out" stacks.

# A Note on Hash Keys
string = { "height" => "6 ft" } # string as key
array = { ["height"] => "6 ft" } # array as key
integer = { 1 => "one" } # integer as key
float = { 45.324 => "forty-five point something" } # float as key
hash = { { key: "key" } => "hash as a key" } # hash as key

p string, array, integer, float, hash

# Common Hash Methods
# #key?
# The #key? method allows you to check if a hash contains a specific key. It returns a boolean value.
p person.key? :name
p person.key? "name"

# #select
# The #select method allows you to pass a block and will return any key-value pairs that evaluate to true when passed to the block.
p person.select { |k, v| k == 'bob' }

# #fetch
# The #fetch method allows you to pass a given key and it will return the value for that key if it exists. It will raise a KeyError if not. You can also specify an option for return if that key is not present, and that gets returned instead of raising a KeyError.
p person.fetch "George", "You don't know that person."

# #to_a
# The #to_a method returns an array version of your hash when called. Let's see it in action. It doesn't modify the hash permanently though.
p person.to_a

# #keys and #values
p person.keys
p person.values
# Since #keys and #values returns an array, you can do stuff like:
person.keys.each { |k| p k }
