def double_odd_index(array)
  doubled_numbers = []
  counter = 0

  loop do
    current_num = array[counter]
    if counter.odd?
      current_num *= 2
      doubled_numbers << current_num
    else
      doubled_numbers << current_num
    end

    counter += 1
    break if counter == array.size
  end

doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]


p double_odd_index(my_numbers) 