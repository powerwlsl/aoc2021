input_path = File.expand_path('./input1.txt', __dir__)

bingo = []
boards = []
board = []

File.readlines(input_path).each_with_index do |line, index|
  if index == 0
    bingo = line.split(',').map(&:to_i)
  elsif index == 1
  else
    if line == "\n"
      boards << board
      board = []
    else
      board << line.split(" ").map(&:to_i)
    end
  end
end

def get_last_board(bingo, boards)
  called_numbers = []


  boards_clone = boards.clone
  (bingo.length-1).times do |bingo_index|
    called_numbers << bingo[bingo_index]

    boards.each do |b|
      if bingo?(b, called_numbers)
        boards_clone.delete(b)

        if boards_clone.length == 0
          print "called_numbers: #{called_numbers}"
          puts called_numbers[-1]
          sum = (b.flatten - called_numbers).sum
          puts "sum #{sum}"
          return sum * called_numbers[-1]
        end
      end
    end
  end
end

def bingo?(board, called_numbers)
  5.times do |i|
    5.times do |j|
      if board[i][j] == called_numbers[-1]
        if check_row(board, i, called_numbers) || check_column(board, j, called_numbers)
          return true
        else
          return false
        end
      end
    end
  end
  false
end


def check_row(b, i, called_number)
  (b[i] - called_number).empty?
end

def check_column(b, j, called_number)
  column = [b[0][j], b[1][j], b[2][j], b[3][j], b[4][j]]
  (column - called_number).empty?
end



puts get_last_board(bingo, boards)


