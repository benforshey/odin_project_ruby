# NESTED COLLECTIONS
test_scores = [
  [97, 76, 79, 93],
  [79, 84, 76, 79],
  [88, 67, 64, 76],
  [94, 55, 67, 81]
]

teacher_mailboxes = [
  ["Adams", "Baker", "Clark", "Davis"],
  ["Jones", "Lewis", "Lopez", "Moore"],
  ["Perez", "Scott", "Smith", "Young"]
]

p teacher_mailboxes[0][0]
p teacher_mailboxes[1][0]
p teacher_mailboxes[2][0]

p teacher_mailboxes[0][-1]
p teacher_mailboxes[-1][0]
p teacher_mailboxes[-1][-2]

# If you try to access an index of a nonexistent nested element, it will raise an NoMethodError, because the nil class does not have a [] method. However, just like a regular array, if you try to access a nonexistent index inside of an existing nested element, it will return nil.
# p teacher_mailboxes[3][0] # NoMethodError
p teacher_mailboxes[0][8] # nil

# #dig returns nil instead of NoMethodError.
p teacher_mailboxes.dig(3, 0)
p teacher_mailboxes.dig(0, 8)

# Creating a New Nested Array
# According to the Array class documentation, the second optional argument for Array.new (the default value), should only be used with an immutable (unable to be changed) object such as a number, boolean value, or symbol. Using a string, array, hash, or other mutable object may result in confusing behavior because each default value in the array will actually be a reference to the same default value. Therefore, any change to one of the elements will change all of the elements in the array.
# To create an immutable array of mutable objects (string, array, hash, etc), you will need to pass the default value for Array.new via a block, using curly braces, instead of the second optional argument. The code in the block gets evaluated for every slot in the array, creating multiple objects to initialize the array with, rather than references to the same object.
# This is the procedure that you *should not* use for mutable data types.
p mutable = Array.new(3, Array.new(2))
mutable[0][0] = 1000
p mutable

# This is the immutable procedure you should use for mutable data types; the block runs once per iteration.
p immutable = Array.new(3) { Array.new(2) }
# Note that the syntax Array.new(3, { Array.new(2) }) is invalid.
immutable[0][0] = 1000
p immutable

# Adding and Removing Elements
# You can add another element to the end of a nested array using the #push method or the shovel operator <<. If you want to add an element to a specific nested array, you will need to specify the index of the nested array.
test_scores << [100, 99, 98, 97]
test_scores[0] << 100 # or test_scores[0].push(100)
p test_scores

# Iterating Over a Nested Array
# You might find it helpful to think of a nested array as having rows and columns. Each row is the nested element and each column is the index of the nested element. When we iterate over the teacher_mailboxes example, each element will be one row.
teacher_mailboxes.each_with_index do |row, row_index|
  row.each_with_index do |teacher, column_index|
    puts "Row:#{row_index} Column:#{column_index} = #{teacher}"
  end
end

# Although these examples are a bit contrived, it is important to note that if we only need each teacher’s name it would be beneficial to use #flatten before iterating.
teacher_mailboxes.flatten.each do |teacher|
  puts "#{teacher} is amazing!"
end

test_scores.any? do |scores|
  p scores.all? { |score| score > 80 }
end

# Accessing Data in Nested Hashes
vehicles = {
  alice: { year: 2019, make: "Toyota", model: "Corolla" },
  blake: { year: 2020, make: "Volkswagen", model: "Beetle" },
  caleb: { year: 2020, make: "Honda", model: "Accord" }
}

p "#{vehicles[:blake][:make]} #{vehicles[:blake][:model]}"
# Similar to nested arrays, if you try to access a key in a nonexistent nested hash, it will raise an NoMethodError, therefore you may want to use the #dig method. As expected, if you try to access a nonexistent key in an existing nested hash, it will return nil.

p vehicles.dig(:blake, :mileage)

# Adding and Removing Data in Nested Hashes
vehicles[:ben] = { year: 1998, make: "Volvo", model: "v70" }
vehicles[:ben][:mileage] = 198_207

p vehicles

vehicles[:ben].delete(:mileage)

p vehicles

# Methods
# Who owns newer vehicles?
p vehicles.select { |name, data| data[:year] >= 2020 }
# Remember, #select has #filter aliased to it.
p vehicles.filter { |name, data| name if data[:year] >= 2020 }

# If you only need something like names (not the whole hash), #collect (#map is aliased to #collect).
p vehicles.collect { |name, data| name if data[:year] >= 2020 }
# Can remove the `nil` values by #compact.
p vehicles.collect { |name, data| name if data[:year] >= 2020 }.compact
# #filter_map does #collect.#compact
p vehicles.filter_map { |name, data| name if data[:year] >= 2020 }
