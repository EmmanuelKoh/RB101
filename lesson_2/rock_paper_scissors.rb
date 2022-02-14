VALID_CHOICES = %w(rock paper scissors lizard spock)

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
  (first == 'rock' && second == 'lizard') ||
  (first == 'paper' && second == 'rock') ||
  (first == 'paper' && second == 'spock') ||
  (first == 'scissors' && second == 'paper') ||
  (first == 'scissors' && second == 'lizard') ||
  (first == 'lizard' && second == 'spock') ||
  (first == 'lizard' && second == 'paper') ||
  (first == 'spock' && second == 'scissors') ||
  (first == 'spock' && second == 'rock')
end

def sub_letter_choice(letter)
  case letter
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'l'
    'lizard'
  when 'sc'
    'scissors'
  when 'sp'
    'spock'
  else
    letter
  end
end


def result(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It's a draw!"
  end
end

def prompt(message)
  puts "=> #{message}"
end

def winner(player_score, computer_score)
  if player_score == 3
    prompt "you won the tournament!"
  elsif computer_score == 3
    prompt "computer won the tounament!"
  else
    prompt "error"
  end
end

player_score = 0
computer_score = 0

loop do

  choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp

    if choice.downcase == 's'
      prompt "type 'sc' for 'scissors'; 'sp' for 'spock'"
      next
    end

    choice = sub_letter_choice(choice)

    if VALID_CHOICES.include?(choice) || VALID_CHOICES.include?(sub_letter_choice(choice))
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose #{choice}; Computer chose: #{computer_choice}"
  prompt result(choice, computer_choice)

  results = result(choice, computer_choice)
  if results == "You won!"
    player_score += 1
  elsif results == "Computer won!"
    computer_score += 1
  end

  prompt "Your score is: #{player_score}"
  prompt "Computer score is: #{computer_score}"

  if player_score >= 3 || computer_score >= 3
    winner(player_score, computer_score)
    break
  end

  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')


end

prompt "That you for playing. Good bye!"
