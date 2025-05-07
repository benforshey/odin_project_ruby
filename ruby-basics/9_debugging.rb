# DEBUGGING
# Stack Trace
# The stack trace prints each line of code in your program that was executed before it crashed. The very first line of the stack trace will generally provide the most useful information about the error your program encountered.
# And yes, in Ruby, errors (Exceptions) are also objects.

# Debugging with #puts / #p
# You get this...the poor man's debugger.
def isogram?(string)
  original_length = string.length
  unique_length = string.downcase.split('').uniq.length

  original_length == unique_length
end

p isogram?("Odin")
p isogram?('carrot')

# Debugging with [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug)
# To use Pry-byebug, you’ll first need to install it in your terminal by running `gem install pry-byebug`. You can then make it available in your program by requiring it at the top of your file with `require 'pry-byebug'`. Finally, to use Pry-byebug, you just need to call `binding.pry` at any point in your program.
# This is pretty much like using a debugger in JavaScript.
require 'pry-byebug'

def isogram?(string)
  original_length = string.length
  string_array = string.downcase.split

  binding.pry

  unique_length = string_array.uniq.length
  original_length == unique_length
end

isogram?("Odin")
