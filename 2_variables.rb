# DOCS: https://launchschool.com/books/ruby/read/variables
# variable scope is defined by a method definition or by a block
# Be aware that not all do...end pairs imply a block. We will explore this in much greater detail in later courses. In particular, a do...end on a for or while loop is not a block.
# Put another way, the key distinguishing factor for deciding whether code delimited by {} or do/end is considered a block (and thereby creates a new scope for variables), is seeing if the {} or do/end immediately follows a method invocation. `for` is a Ruby keyword, not a method invocation.

# VARIABLE DECLARATION
# like in other languages...much is relatable
age = 6
age = 6 + 1
# also age = age + 1
age += 1
age -= 1

puts age

cash = 10
cash *= 2

puts cash

temp = 32
temp /= 8

puts temp

# again, as in other languages: a variable is effectively a reference or a pointer to that address in memory.
original = 'accept no subsitutes'
subsitute = original

puts subsitute

did_you_expect_this = original
did_you_expect_this.upcase!

puts original, subsitute, did_you_expect_this

# "As indicated in this article (https://launchschool.com/books/ruby/read/variables), remember that you should not use $global_variables. Additionally, @@class_variables are rarely needed and easily misused." So far, we've used local variables.
# Constants
LIKE_IN_OTHER_LANGUAGES = true
# Convention, not language enforced
LIKE_IN_OTHER_LANGUAGES = false
puts LIKE_IN_OTHER_LANGUAGES
