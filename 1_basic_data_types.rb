# NUMBERS
# It’s important to keep in mind that when doing arithmetic with two integers in Ruby, the result will always be an integer.
puts 13.to_f
puts 13.0.to_i

puts 6.even?
puts 6.odd?


# STRINGS
# With the plus operator:
"Welcome " + "to " + "Odin!"    #=> "Welcome to Odin!"

# With the shovel operator:
"Welcome " << "to " << "Odin!"  #=> "Welcome to Odin!"

# With the concat method:
"Welcome ".concat("to ").concat("Odin!")  #=> "Welcome to Odin!"

# Like other languages, can access via index notation.
"hello"[0]      #=> "h"

"hello"[0..1]   #=> "he"

"hello"[0, 4]   #=> "hell"

"hello"[-1]     #=> "o"

# Escape Characters
# \\  #=> Need a backslash in your string?
# \b  #=> Backspace
# \r  #=> Carriage return, for those of you that love typewriters
# \n  #=> Newline. You'll likely use this one the most.
# \s  #=> Space
# \t  #=> Tab
# \"  #=> Double quotation mark
# \'  #=> Single quotation mark

# Interpolation
name = "Odin"

puts "Hello, #{name}" #=> "Hello, Odin"
puts 'Hello, #{name}' #=> "Hello, #{name}"

# Common String Methods https://docs.ruby-lang.org/en/3.3/String.html
# Many common carryovers, but check out the String class for all the juicy deets.
"he77o".sub("7", "l")           #=> "hel7o"

"he77o".gsub("7", "l")          #=> "hello"

"hello".insert(-1, " dude")     #=> "hello dude"

"hello world".delete("l")       #=> "heo word"

"!".prepend("hello, ", "world") #=> "hello, world!"

# Converting to Strings
5.to_s        #=> "5"

nil.to_s      #=> ""

:symbol.to_s  #=> "symbol"

# SYMBOLS
# Strings can be changed, so every time a string is used, Ruby has to store it in memory even if an existing string with the same value already exists. Symbols, on the other hand, are stored in memory only once, making them faster in certain situations.
# One common application where symbols are preferred over strings are the keys in hashes. We’ll cover this in detail in the hashes lesson later in the course.
puts :a_symbol

# In Ruby, everything is an object...
"string" == "string"  #=> true

"string".object_id == "string".object_id  #=> false

:symbol.object_id == :symbol.object_id    #=> true

# BOOLEANS
# They exist...nothing new in this language.
# `nil`, not `null`
