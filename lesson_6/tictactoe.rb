require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |     "
  puts ""
end
# rubocop: enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  #pick winning square
  square = detect_square_to_win(brd)
  #pick square to defend
  if !square
    square = detect_square_to_defend(brd)
  end

  if !square && empty_squares(brd).include?(5)
    square = 5
  elsif !square
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def detect_square_to_defend(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
       brd.values_at(*line).count(' ') == 1
       return line.select { |square| brd[square] == INITIAL_MARKER}.first
    end
  end
  nil
end

def detect_square_to_win(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2 &&
       brd.values_at(*line).count(' ') == 1
       return line.select { |square| brd[square] == INITIAL_MARKER}.first
    end
  end
  nil
end  

def joinor(brd, delimiter = ', ', str = 'or')
  case brd.size
  when 0 then ''
  when 1 then brd.first
  when 2 then brd.join(" #{str} ")
  else
    brd[0..-2].join(delimiter) + "#{delimiter}#{str} #{brd.last}"
  end
end

def keep_score(hash, name)
  !!hash[name] ? hash[name] += 1 : hash[name] = 1 
end

def print_score(score)
  score.each { |name, point| puts "#{name}: #{point}" }
end

def ask_player_order
  order = nil
  loop do 
    puts "Would you like to go first or second? Enter 1 or 2"
    order = gets.chomp.to_i
    break if order == 1 || order == 2
    puts "That is an invalid input"
  end
  order
end

loop do
  score = {}
  order = ask_player_order
  loop do
    board = initialize_board
    display_board(board)

    loop do
      print_score(score)
      if order == 1
        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)

        computer_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
        display_board(board)
      else
        computer_places_piece!(board)
        display_board(board)
        break if someone_won?(board) || board_full?(board)

        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
      end
    end

    

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      keep_score(score, detect_winner(board))
    else
      prompt "it's a tie!"
    end

    score.each do |name, point|
      if point >= 5
        puts "#{name} has won the game of Tic Tac Toe with a score of #{point}!"
      end
    end
    break if score.any? { |_, point| point >= 5 }
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end
prompt "Thanks for playing Tic Tac Toe! Good bye!"
