
def select_letter(str, char)
  new_str = ''
  counter = 0

  loop do
    current_char = str[counter]

    if current_char == char
      new_str << current_char
    end

    counter += 1
    break if counter == str.length
  end

  new_str
end



question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => "aaaaaaaa"
p select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z') # => ""