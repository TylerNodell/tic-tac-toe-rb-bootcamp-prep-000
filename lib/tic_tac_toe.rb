
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(array, index, value = "X")
  array[index] = value
end

def position_taken?(board, index)
  ind = board[index]
  if ind == "X" || ind == "O"
    return true
  elsif ind == " " || ind == "" || ind == nil
    return false
  end
end

def valid_move?(board, index)
  if position_taken?(board[index]) == false && index.between?(0, 8)
    return true
  elsif position_taken?(board[index]) == true
    return false
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index)
    display_board(board)
  if position_taken?(board[index]) == false && index.between?(0, 8)
    return true
  elsif position_taken?(board[index]) == true
    return false
  else
    return false
  end
end

def turn_count(board)
  board.count{|counter| counter == "X" || counter == "O"}
end

def won?(board)
  WIN_COMBINATIONS.detect{|combination|
      board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] && position_taken?(board, combination[0])
    }
end

def full?(board)
  !board.any?{ |i| i == " " }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board)  || won?(board)
end

def winner(board)
  if combo = won?(board)
    board[combo[0]]
  end
end

def turn_count(board)
  counter = 0
  board.each{|slot|
    if slot != " "
      counter += 1
    end }
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end
