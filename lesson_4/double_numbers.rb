my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers!(numbers)
  counter = 0

  loop do
    numbers[counter] = numbers[counter] * 2
    counter += 1

    break if counter == numbers.size
  end
  numbers
end



p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]