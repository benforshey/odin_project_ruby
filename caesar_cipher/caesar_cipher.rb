# Goal:
# Implement a Caesar cipher that takes in a string and the shift factor and then outputs the modified string using a right shift.
def caesar_cipher(to_encode:, shift: 7, alphabet: %w[a b c d e f g h i j k l m n o p q r s t u v w x y z])
  to_encode.split('').map do |char|
    index = alphabet.find_index(char.downcase)
    is_upper = char == char.upcase

    if index.is_a? Integer
      wrapped_index = (index + shift) % alphabet.length
      is_upper ? alphabet[wrapped_index].upcase : alphabet[wrapped_index]
    else
      char
    end
  end.join('')
end
