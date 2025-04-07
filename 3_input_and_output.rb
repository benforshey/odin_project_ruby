# DOCS: https://www.tutorialspoint.com/ruby/ruby_input_output.htm
# INPUT AND OUTPUT
# `puts` vs `print`
# To highlight the difference between puts and print, we’re going to pull out a piece of rarely used Ruby syntax: the semicolon. In short, semicolons are never required in Ruby, but they allow you to run multiple Ruby commands all on one line.
# irb(main):001:0> print "Hello World"; print "I love drinking coffee"
# Hello WorldI love drinking coffee=> nil
#
# irb(main):002:0> puts "Hello World"; puts "I love drinking coffee"
# Hello World
# I love drinking coffee
# => nil
#
# `p` and `pp`
# `p` is generally for debugging, when you want more info about the object. It also returns a value, whereas `puts` does not.
# `pp` pretty prints your output

# Input Commands
# `gets` returns the user CLI input, so can be assigned to a variable
# The gets command always returns a new line at the end of the input. This command often makes use of a “separator” to read streams and multi-line files...

# irb(main):001:0> new_string = gets.chomp
# This is a sentence.
# => "This is a sentence."
#
# irb(main):002:0> puts new_string
# This is a sentence.
# => nil
#
# #chomp is a method commonly used to trim separators
#
# #putc output a character at a time
#
# File.new cannot be associated with a block, but File.open can.
# Rather than being an insignificant distinction, I imagine this is the core of ensuring resource deallocation. E.g, from The Pragmatic Programmer:
# def update_customer(transaction_amout)
#   File.open("#{@name}.rec", "r+") do |file|
#     read_customer(file)
#     @balance = @balance.add(transaction_amout, 2)
#     write_customer(file)
#   end
# end
#
# There's a lot (of course) to know about I/O, but my takeaways from reading the docs is that Ruby has a good set of tools for common file operations, including temporary directories.
