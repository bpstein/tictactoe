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

def initialize_board
	b = {}
	(1..9).each {|position| b[position] = ' '}
	b
end

def draw_board(b)
	system 'clear'
	puts "------------------"
	puts "  #{b[1]}  |  #{b[2]}  |  #{b[3]}"
	puts "------------------"
	puts "  #{b[4]}  |  #{b[5]}  |  #{b[6]}"
	puts "------------------"
	puts "  #{b[7]}  |  #{b[8]}  |  #{b[9]}"
	puts "------------------"
end

def empty_positions(b)
	b.select {|k, v| v == ' '}.keys
end

def player_picks_square(b)
	puts "Please pick a square (1-9)."
	position = gets.chomp.to_i
	b[position] = 'X'
end

def computer_picks_square(b)
	position = empty_positions(b).sample
	b[position] = 'O'
end

def check_winner(b)
	winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
	winning_lines.each do |line|
		if b[line[0]] == 'X' and b[line[1]] == 'X' and b[line[2]] == 'X'
			return 'Player'
		elsif b[line[0]] == 'X' and b[line[1]] == 'X' and b[line[2]] == 'X'
			return 'Computer'
		else 
			return nil
		end
	end
end


board = initialize_board
draw_board(board)
	
begin 
	player_picks_square(board)
	computer_picks_square(board)
	draw_board(board)
	winner = check_winner(board)
end until winner || empty_positions(board).empty?

if winner
	"#{winner} won!"
else
	puts "It's a tie!"
end