# Welcome message for user

# Play as x or o?

# Set up 9-grid board for gameplay (squares 1 to 9)

# Request x or o from the user (select 1-9 from user)

# Computer makes a guess (select random 1-9 from computer)

# Request x or o from the user

# Computer makes a guess

# Request x or o from the user

# Computer makes a guess

# Winning combinations:
	# 1, 2, 3
	# 1, 4, 7
	# 1, 5, 9
	# 2, 5, 8
	# 3, 6, 9
	# 4, 5, 6
	# 7, 8, 9
	# 7, 5, 3


# Deadlock 

# Loop until a winner is found, or all squares are taken
require 'pry'

def initialize_board
	b = {}
	(1..9).each {|position| b[position] = ' '}
	b
end

def draw_board(b)
	puts "  #{b[1]}  |  #{b[2]}  |  #{b[3]}"
	puts "------------------"
	puts "  #{b[4]}  |  #{b[5]}  |  #{b[6]}"
	puts "------------------"
	puts "  #{b[7]}  |  #{b[8]}  |  #{b[9]}"
end

def player_picks_square(b)
	puts "Please pick a square (1-9)."
	position = gets.chomp.to_i
	b[position] = 'X'
	binding.pry
end

board = initialize_board

draw_board(board)
	player_picks_square(board)
begin 

end until winner || all_squares_taken?