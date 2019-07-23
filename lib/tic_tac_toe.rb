class TicTacToe

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def won?
    WIN_COMBINATIONS.find do |win_combination|
      @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X" or @board[win_combination[0]] == "O" && @board[win_combination[1]] =="O" && @board[win_combination[2]] == "O"
    end
  end

  def full?
    @board.none? {|position| position == " "}
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    if won? || draw? || full?
      true
    else
      false
    end
  end


  def winner
    if won?
      @board[won?(board)[0]]
    else
      nil
    end
  end

  def valid_move?(index)
    if index.between?(0, 8) && @board[index] == " "
      true
    else
      false
    end
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    count = turn_count
    if count % 2 == 0
      'X'
    else
      'O'
    end
  end

  def turn
    puts "Enter a position, from 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      if current_player(board) == 'X'
        move(index, 'X')
      else
        move(index, 'O')
      end
      display_board
    else
      turn
    end
  end

end
