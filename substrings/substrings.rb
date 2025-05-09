# Goal:
# Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found. Next, make sure your method can handle multiple words:

def substrings(haystack:,
               dictionary: %w[below down go going horn how howdy it i low own part partner sit])
  dictionary.each_with_object(Hash.new(0)) do |current, accumulator|
    for word in haystack.split(' ') do
      accumulator[current] += 1 if word.include? current
    end
  end
  # I tried to use what I know (reduce), but RuboCop insisted on #each_with_object.
  # After reading [this article](https://www.leejroberts.com/reduce-vs-each_with_object/), I get it.
  # Ruby amazes me in the sense that it has a built-in method that distinguishes developer ergonomics at this level, and it frightens me because if it does that, there are going to be a million possible ways to get something done. You'll *need* RuboCop to stop arguments and get on with solving problems.
  # dictionary.reduce(Hash.new(0)) do |accumulator, current|
  #   for word in haystack.split(' ') do
  #     if word.include? current
  #       accumulator[current] += 1
  #     end
  #   end
  #
  #   accumulator
  # end
end

p substrings(haystack: 'below')
p substrings(haystack: 'below below below')
p substrings(haystack: "Howdy partner, sit down! How's it going?")
