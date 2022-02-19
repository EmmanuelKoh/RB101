statement = "The Flintstones Rock"

frequency_hash = {}

statement.strip.chars.each do |char|
  frequency_hash.include?(char) ? frequency_hash[char] += 1 : frequency_hash[char] = 1
end

p frequency_hash