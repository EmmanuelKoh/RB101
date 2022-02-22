statement = "The Flintstones Rock"

frequency_hash = {}

statement.strip.chars.each do |char|
  frequency_hash.include?(char) ? frequency_hash[char] += 1 : frequency_hash[char] = 1
end

p frequency_hash


### alternatively
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end

