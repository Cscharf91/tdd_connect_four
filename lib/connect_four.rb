require_relative 'cell.rb'
require_relative 'board.rb'
require_relative 'game.rb'
require_relative 'player.rb'
require_relative 'core_extensions.rb'

puts "Welcome to Connect Four!"
puts "Player 1: X symbol"
puts "Enter your name:"
p1_name = gets.chomp
p1 = Player.new({color: "X", name: p1_name})
puts "Player 2: O symbol"
puts "Enter your name:"
p2_name = gets.chomp
p2 = Player.new({color: "O", name: p2_name})
players = [p1, p2]
Game.new(players).play