# DOCS: https://launchschool.com/books/ruby/read/flow_control#conditionals
# When comparing strings, the comparison is character-by-character. Ruby moves from left-to-right in the strings looking for the first character that is different from its counterpart in the other string. Once it finds a character that differs, it compares that character with its counterpart, and makes a decision based on that. If both strings are equal up to the length of the shorter string as in the final example, then the shorter string is considered less than the longer string.
# CONDITIONAL LOGIC

# much is the same as other languages, with common operators (<, >, <=, >=, ==, !=, &&, ||).
room_tidy = false
if room_tidy == true
  puts "Let's play some Rust!"
else 
  puts "Let's clean up first!"
end

# Also, ||= is basically nullish coalescing from JS.
is_defined = nil
is_defined ||= 'default value'
puts is_defined

# Truthy and Falsy
# The only false values in Ruby are the values nil and false themselves; everything else evaluates as truthy in flow control.
# What an interesting departure from the majority!

# The Road to Refactor is Paved with One Liners
message = "Yeah, this is pretty grokkable."
puts message if message.length <= 80

attack_by = 'sea'
if attack_by == 'land'
  puts "release the goat"
elsif attack_by == 'sea' # NGL, I might end up typing "elseif" more times than I'd like.
  puts "release the shark"
else
  puts "release Kevin the octopus"
end

# Boolean Logic
# Has common operators, but interestingly === is caled case equality operator, membership operator, or triple equals. A good writeup: https://dev.to/baweaver/understanding-ruby-triple-equals-2p9c
# By default, === is aliased to ==. It's not "strict equals", like in JS; stay away from it unless you know what you're doing and so does your team.
puts 5 === 5
puts 5 == 5

#eql? checks both the value type and the actual value it holds.
puts 5.eql?(5.0)

#equal? checks whether both values are the exact same object in memory.
a = 5
b = 5
# works for
puts a.equal?(b)
a = "foo"
b = "foo"
# but not
puts a.equal?(b)
# becuase strings (always mutable) are stored per instance in difference memory spaces
a = :foo
b = :foo
# see :symbol for getting the last bit of bood out of that turnip
puts a.equal?(b)

# Spaceship Operator
# Now we're getting somewhere! Useful in sorting functions.
# <=> (spaceship operator) returns the following:
# -1 if the value on the left is less than the value on the right;
# 0 if the value on the left is equal to the value on the right; and
# 1 if the value on the left is greater than the value on the right.
puts 1 <=> 2
puts 1 <=> 1
puts 2 <=> 1


if 1 < 2 && 5 < 6
  puts "This is happening?! (symbolic)"
end

# This can also be written as, but YSK that sybmolic operators are evaluated at a *much* higher priority than English style operators (even lower than *assignment*); see:
# https://graceful.dev/courses/the-freebies/modules/ruby-language/topic/episode-125-and-or/
if 1 < 2 and 5 < 6
  puts "This is happening?! (English style)"
end
# can create gotchas if you don't understand the rules
user = Struct.new(:name).new("Ben")
user_name = user && user.name
puts user_name
user_name = user and user.name
puts user_name
# Above English style is evaluated like (user_name = user) and user.name. Now *that's* a low evaluation priority.
# This is because they are inherited from Perl, where you might write something like:
# cd "/usr/bin/package" or die "Can't cd into package"
# which is using the short-circuit evaluation of "or" to die if you can't `cd`
# A Ruby version of this:
raise "Whoa, leaving so soon?!" unless line = $stdin.gets # press <C-c> <C-d> to raise
# this would fail because of operator precedence:
# line = $stdin.gets || raise "Can't read from STDIN"
# this works, though!
# line = $stdin.gets or raise "Can't read from STDIN"
# truthfully, the raise / unless reads so much cleaner anyway!
# Think: some of this probably has to do with the double duty parenthesis do in Ruby as optional around function calls and logical grouping of expressions.
# Advice: use English language operators only in control flow constructs, rather than evaluating them for their return value.

# Ruby does short circuit evaluation.
if 10 < 2 || 5 < 6
  puts "Still gonna happen."
end

# This can also be written as
if 10 < 2 or 5 < 6
  puts "Still gonna happen."
end

# Case Statements
# You can get pretty creative with them: https://www.honeybadger.io/blog/rubys-case-statement-advanced-techniques/
# returns on first match
grade_points = 91
honor_role_eligible = nil
letter_grade = case grade_points
  when 0..59 then "F"
  when 60..69 then "D"
  when 70..79 then "C"
  when 80..89 then "B"
  when 90..100
    honor_role_eligible = true
    "A"
else 
  if grade_points < 0
    "Well, there's always tutoring!"
  elsif grade_points > 100
    "That's got to feel good!"
  end
end

puts "A grade of #{letter_grade} #{honor_role_eligible ? 'is' : 'is not'} eligible for the Honor Role."

# Unless Statements
# You should use an unless statement when you want to not do something if a condition is true, because it can make your code more readable than using if !true.
# I'm low-key jealous that I don't get this in JavaScript!
age = 19
unless age < 18
  puts "You're an adult in the USA."
end

# Ternary Statements
# condition ? <execute if true> : <execute if false>
excuses = true
puts excuses ? "Excuses are the nails that build the house of failure." : "Don't forget to enjoy the moment you're in right now."
 
# Type Coercion 
# Just like in JS, stringing together two "not" operators works to coerce types to Boolean.
x = 5
y = nil
puts !!(x || y)
