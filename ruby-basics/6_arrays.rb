# DOCS: https://launchschool.com/books/ruby/read/arrays
# ARRAYS

# Like other languages, an array is an ordered list of data.
# The individual variables, numbers, or strings within an array are known as elements.
num_array = [1, 2, 3, 4, 5]
# str_array = ["This", "is", "a", "small", "array"]
# RuboCop instroduced me to this, which is a percent literal (https://ruby-doc.org/3.4.1/syntax/literals_rdoc.html#label-Percent+Literals).
str_array = %w[This is a small array]
str_array_symols = %i[This is a small array]

p str_array_symols

# Can also initialize the class instead of using an array literal.
Array.new               #=> []
Array.new(3)            #=> [nil, nil, nil]
Array.new(3, 7)         #=> [7, 7, 7]
Array.new(3, true)      #=> [true, true, true]

# Accessing Elements
puts "Accessing Elements"
# Like other languages, Ruby uses zero-based index access for arrays.
p str_array[0], str_array[-1]

# But because it's Ruby, it also has:
p str_array.first, str_array.last
p num_array.first(2), num_array.last(2)

# Adding and Removing Elements
puts "Adding and Removing Elements"
num_array.push(6, 7,)
num_array << 'oops'
# retuns popped; mutative operation
mistake = num_array.pop
p mistake
p num_array

# The methods #shift and #unshift are used to add and remove elements at the beginning of an array. The #unshift method adds elements to the beginning of an array and returns that array (much like #push). The #shift method removes the first element of an array and returns that element (much like #pop).
# Like #first and #last, both #pop and #shift can take integer arguments.
# Both the push and the << methods mutate the caller, so the original array is modified.
shifted = num_array.shift
puts "shifted #{shifted}"
num_array.unshift(shifted)
p num_array

# Adding and Subtracting Arrays
puts "Adding and Subtracting Arrays"

a = [1, 2, 3]
b = [3, 4, 5]

p a + b
p a.concat(b)

# To find the difference between two arrays, you can subtract them using -. This method returns a copy of the first array, removing any elements that appear in the second array.
p [1, 1, 1, 2, 2, 3, 4] - [1, 4]

# Basic Methods (https://docs.ruby-lang.org/en/3.3/Array.html)
puts "Basic Methods"
# Oh, nice!
p str_array.methods

# Some common methods:
p [].empty?
p [[]].empty?
p [1, 2].empty?

p [1, 2, 3].length

p [1, 2, 3].reverse

p [1, 2, 3].include?(3)
p [1, 2, 3].include?("3")

p [1, 2, 3].join
p [1, 2, 3].join("-")

# Iteration
# Like in other languages, the map method iterates over an array applying a block to each element of the array and returns a new array with those results. Not mutative.
# #collect is aliased to #map.
fruits = ['orange', 'avacodo', 'banana', 'strawberry']
fruits.map { |fruit| p fruit.upcase }

fruits.unshift('potato')
fruits.insert(0, 'potato')
fruits.push('potato')
p fruits
# The delete method permanently deletes all instances of the provided value from the array, returning the deleted item. Ruby continues to impress.
deleted = fruits.delete('potato')
p deleted
# #uniq iteratores through an array, deletes any duplicate values that exist, then returns the result as a new array.
# If you add the bang suffix (!) to this method, you can perform the uniq method destructively. Much like the way the delete method works.
fruits.push("avacodo")
p fruits
p fruits.uniq()

# Methods with a !
# "The bang suffix (!) at the end of the method name usually indicates that the method will change (or mutate) the caller permanently. Unfortunately this is not always the case. It is a good rule to be wary of any method that has the bang suffix and to make sure to check the Ruby documentation to see if it will behave destructively (the word "destructive" here just means mutating the caller)."
# "Also, please note that there are methods like pop and push that are destructive, but do not have a ! at the end. It's a little confusing in the beginning, but as you write more programs in Ruby, you'll start to get a feel for which methods are destructive and which are not."

# Equality
# You can compare arrays for equality using the == operator.
