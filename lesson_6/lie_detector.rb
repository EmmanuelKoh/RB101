
loop do


  names = ''
  loop do
    puts "==> Enter your name to continue."
    names = gets.chomp
    break if names != ''
    puts "name can't be empty :\("
  end
  puts "Hi #{names}! Type `ok` when you are ready"

  arr = [
       "You are a liar, #{names}!!:\(", 
       "That was the truth :\)", 
       "How dare you lie to us! >:\(", 
       "Thanks for being honest, #{names} :D", 
       "Liar, liar, pants on fire",
       "I knew you weren't lying :D",
       "C'mon #{names}, be honest. LIAR!"
     ]

  loop do
    verify = gets.chomp
    break if verify == 'ok'
    puts "Hm.. are you ready now?"
  end
  

  question = false
  loop do
    puts "What was the question?"
    question = gets.chomp
    break if question != ''
    puts "you gotta ask the lie detector a question!"
  end

  
  answer = false
  loop do
    puts "Enter your answer below"
    answer = gets.chomp
    break if answer != ''
    puts "you gotta give an answer!!"
  end  

  puts "determining if that was the truth..."

  puts "#{names} responded '#{answer}' to the question: '#{question}..."

  sleep(2)
  puts "..."
  puts "hm..."
  sleep(0.5)
  puts "still analyzing..."
  sleep(0.3)
  puts "..."
  sleep(1)

  puts "====================="
  puts arr.sample
  puts "====================="

  sleep(0.5)
  puts "Would you like to run the lie detector again? (Y/N)"
  play = gets.chomp
  break if play.downcase == 'n'
end