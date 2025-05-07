# DOCS:
# Methods
# "Many languages distinguish between functions, which have no associated object, and methods, which are invoked on a receiver object. Because Ruby is a purely object-oriented language, all methods are true methods and are associated with at least one object." Easy peasy!
# If you're a little contrarian like me, and maybe wonder where the #puts #gets global methods are coming from, that would be the Kernel module through the Object class.
#
# Creating a Method
def my_name
  "Joe Smith"
end

puts my_name

# Conventions & Rules
# snake_case, lowercase; like many other languages, constants CAPITAL=true
# reserved words: https://docs.ruby-lang.org/en/3.3/keywords_rdoc.html
# _, ?, !, and = are the only allowed symbols
# ?, !, and = may only be used at the end of the name
# cannot bein a method name with a number
# short, descriptive names are the best

# Parameters and Arguments
# Parameters are variables that your method will receive when it is called.
# If you’re wondering what the differences are between an argument and a parameter, parameters act as placeholder variables in the template of your method, whereas arguments are the actual values that get passed to the method when it is called. Thus, in the following example, name is a parameter and "John" is an argument. The two terms are commonly used interchangeably, though, so don’t worry too much about this distinction.
def greet(name)
  "Hello, " + name + "!"
end

puts greet("John")

# Default Parameters

def greet(name = 'Stranger')
  "Hello, " + name + "!"
end

puts greet()

# Ruby is one of the few languages that offers implicit return for methods, which means that a Ruby method will return the last expression that was evaluated even without the return keyword. The last expression that was evaluated may or may not be the last line in the code, as you can see in the following example:
# An explicit return can be useful when you want to write a method that checks for input errors before continuing.
# Ruby methods ALWAYS return the evaluated result of the last line of the expression unless an explicit return comes before it.
def even_odd(number)
  unless number.is_a? Numeric
    return "A number was not entered."
  end

  if number % 2 == 0
    "That is an even number."
  else
    "That is an odd number."
  end
end

puts even_odd(16)
puts even_odd(17)
puts even_odd('17')

def square(number)
  number * number
end

puts square(4)
square(4).times { |n| p "I will iterate per int: #{n}" }

# Chaining Methods
# Like other langugeas, methods can be chained
phrase = ["be", "to", "not", "or", "be", "to"]

puts phrase.reverse.join(" ").capitalize

# Predicate Methods
# You will sometimes encounter built-in Ruby methods that have a question mark (?) at the end of their name, such as even?, odd?, or between?. These are all predicate methods, which is a naming convention that Ruby uses for methods that return a Boolean, that is, they return either true or false.
puts 5.even?
puts 6.even?
puts 17.odd?
puts 12.between?(10, 15)

# Bang Methods
# When we call a method on an object, such as our whisper string above, it does not modify the original value of that object. A general rule in programming is that you do not want your methods to overwrite the objects that you call them on. This protects you from irreversibly overwriting your data by accident. You are able to overwrite your data by explicitly re-assigning a variable (such as whisper = whisper.downcase). Another way to do this type of reassignment is with bang methods, which are denoted with an exclamation mark (!) at the end of the method name.
# By adding a ! to the end of your method, you indicate that this method performs its action and simultaneously overwrites the value of the original object with the result.
whisper = "HELLO EVERYBODY"

puts whisper.downcase
puts whisper

# If you wanted to mutate, could do one of either:
# whisper = whisper.downcase
whisper.downcase!
puts whisper

# Scope
# Make sure you don't mix up method invocation with a block and method definition when you're working with local variable scope issues. They may look similar at first, but they are not the same. They have different behaviors when it comes to local variable scope.
# Method invocation with a block
# [1, 2, 3].each do |num|
#   puts num
# end
# Method definition
def print_num(num)
  puts num
end

# Mutation
# Like other languages, "primitives" are not mutated inside method scope; the arguments are local copies.
def some_method(number)
  number = 7 # this is implicitly returned by the method
end

a = 5
puts some_method(a)
puts a

# Like other languages, objects can be mutated in surprising ways (since we're pointing to the original object in memory when we reference the argument).
a = [1, 2, 3]

# Example of a method definition that mutates its argument permanently
def mutate(array)
  array.pop
end

p "Before mutate method: #{a}"
mutate(a)
p "After mutate method: #{a}"

# You could rewrite this to be non-destructive:
a = [1, 2, 3]

# Example of a method definition that does not mutate the argument
def no_mutate(array)
  array.last
end

p "Before no_mutate method: #{a}"
no_mutate(a)
p "After no_mutate method: #{a}"

# Method Calls as Arguments
# Ruby treats methods as first-class citizens: they can be passed as arguments to another method.
def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def multiply(a, b)
  a * b
end

p multiply(add(7, 3), subtract(10, 5))

# The Call Stack
# In Ruby, methods aren't the only thing that uses the call stack. Blocks, procs, and lambdas also use the call stack; in fact, they all use the same call stack as Ruby uses for methods. For simplicity, we will usually just mention methods when discussing the call stack. However, you should always remember that blocks, procs, and lambdas are also part of this process.
# The call stack has a limited size that varies based on the Ruby implementation. That size is usually sufficient for more than 10000 stack entries. If the stack runs out of room, you will see a SystemStackError exception.
