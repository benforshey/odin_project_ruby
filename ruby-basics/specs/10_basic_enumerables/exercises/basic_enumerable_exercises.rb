def display_current_inventory(inventory_list)
  inventory_list.each { |k, v| puts "#{k}, quantity: #{v}" }
end

def display_guess_order(guesses)
  guesses.each_with_index { |v, i| puts "Guess \##{i + 1} is #{v}" }
end

def find_absolute_values(numbers)
  numbers.map(&:abs)
  # OR `numbers.map { |n| n.abs }`, which RuboCop doesn't like.
end

def find_low_inventory(inventory_list)
  inventory_list.select { |_k, v| v < 4.0 }
end

def find_word_lengths(word_list)
  # rubocop: disable  Style/EachWithObject
  word_list.reduce({}) do |acc, cur|
    acc[cur] = cur.length
    acc
  end
  # rubocop: enable  Style/EachWithObject

  # RuboCop REALLY wants me to do this:
  word_list.each_with_object({}) do |cur, acc|
    acc[cur] = cur.length
  end

  # use #reduce to iterate through each item of the word_list (an array)
  # return a hash with each word as the key and its length as the value
  # hint: look at the documentation and review the reduce examples in basic enumerable lesson
end
