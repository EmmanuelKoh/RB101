# We need to figure out which number starts from the row number
puts "give row number"
x = gets.chomp.to_i
counter = 0
sequence_index = 0

while counter < x do
  sequence_index += counter
  counter += 1
end

sequence_num = (sequence_index + 1) * 2

sum = 0
i = 0
x.times do 
  sum += (sequence_num + (i * 2))
  i += 1
end

puts sum