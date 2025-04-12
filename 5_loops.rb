# DOCS: https://launchschool.com/books/ruby/read/loops_iterators
# LOOPS

# #loop
# not a beloved iterator..."If you find yourself using loop, know that there is probably a better loop for you out there, like one of the more specific loops below."
# i = 0
# loop do
#   puts "i is #{i}"
#   i += 1
#   break if i == 10
# end

# #while
# Because you declare the condition that breaks the loop up front, the intention of your code is much clearer, making this code easier to read than our loop loop above.
# i = 0
# while i < 10 do
#  puts "i is #{i}"
#  i += 1
# end

# # As a parent, I get this.
# answer = nil
# while answer != "yes" do
#   puts "Are we there yet?"
#   answer = gets.chomp
# end

# #until
# The until loop is the opposite of the while loop. A while loop continues for as long as the condition is true, whereas an until loop continues for as long as the condition is false.
# i = 0
# until i >= 10 do
#  puts "i is #{i}"
#  i += 1
# end

# This is great in lieu of negating your conditional logic in a #while loop.
# answer = nil
# until answer == "yes" do
#   puts "Do you like Pizza?"
#   answer = gets.chomp
# end

# Ranges
# Ruby lets us use something called a range to define an interval. All we need to do is give Ruby the starting value, the ending value, and whether we want the range to be inclusive or exclusive.
(1..5)      # inclusive range: 1, 2, 3, 4, 5
(1...5)     # exclusive range: 1, 2, 3, 4

# We can make ranges of letters, too!
('a'..'d') # a, b, c, d

# We have called the each method using the dot operator (.) on our array. What this method does is loop through each element in our array, in order, starting from 'Bob'. Then it begins executing the code within the block. The block's starting and ending points are defined by the curly braces {}. Each time we iterate over the array, we need to assign the value of the element to a variable. In this example we have named the variable name and placed it in between two pipes |. After that, we write the logic that we want to use to operate on the variable, which represents the current array element. In this case it is simply printing to the screen using puts.
names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']
names.each { |name| puts name }

# For Loop
# using ranges
for i in 0..5
  puts "#{i} zombies incoming!"
end

# #times
# Wow...I mean, that's stupidly readable!
5.times do
  puts "Hello, world!"
end

5.times do |number|
  puts "Alternative fact number #{number}"
end

# #upto and #downto
# Come on, Ruby...are you *trying* to make everyone else look bad?
5.upto(10) { |num| print "#{num} " }     #=> 5 6 7 8 9 10

10.downto(5) { |num| print "#{num} " }   #=> 10 9 8 7 6 5

# Recursion
# Looks like a good read on tail call optimization: https://blog.rpanachi.com/ruby-recursion-stack-size-tail-call-optimization
def doubler(start)
  puts start
  if start < 10
    doubler(start * 2)
  end
end

puts doubler(1)

# TBH, this is a weird fibonacci implementation to me...
def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

puts fibonacci(8)
