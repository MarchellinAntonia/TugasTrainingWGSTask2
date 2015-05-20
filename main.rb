#class yg dipakai
require_relative 'player'

#inisialisasi objek baru
players = Hash.new

input = ""
while !input.eql? "exit"
	puts ""
	puts "# ===================================== #"
	puts "#         Welcome to Battle Arena       #"
	puts "# ===================================== #"
	puts "# Description                           #"
	puts "# 1. type \"new\" to create a character   #"
	puts "# 2. type \"start\" to begin the fight    #"
	puts "# 3. type \"exit\" to quit the game       #"
	puts "# ------------------------------------- #"
	puts "# Current Player:                       #"
	if players.empty?
		puts "# No player available                   #"
	else
		#ambil nama player		
		players.each do |key, player|
			puts "# - #{player.name}                #"
		end
	end
	puts "# * Max player 2 or 3                   #"
	puts "# ------------------------------------- #"
	print "please input : " 
	input = gets.chomp

	case input
	when "new"
		if players.length < 3
			print "Please input player name : "
			name = gets.chomp
			#masukan name baru ke obj player
			players[name]=(Player.new(name))
		else	
			#jika lebih dari 3 pemain
			puts "Can't add more player, Max. player reached!"
			print "Press any key to continue..."
			gets
		end
	when "start"
		#clear console
		puts "\e[H\e[2J"
		puts ""
		puts "# ===================================== #"
		puts "#         Welcome to Battle Arena       #"
		puts "# ===================================== #"
		puts "Battle Start:"
		print "Who will attack: "

		attName = gets.chomp
		while !players.has_key?(attName)
			puts "Player not found!"
			print "Who will attack: "
			attName = gets.chomp
		end
		attacker = players.fetch(attName)

		print "Who get attacked: "
		attName = gets.chomp
		while !players.has_key?(attName)
			puts "Player not found!"
			print "Who will attack: "
			attName = gets.chomp
		end
		victim = players.fetch(attName)
		
		#yg diserang bloodnya kurang 20
		victim.setBlood(victim.blood - 20)

		puts "Description:"
		puts "#{attacker.name} : manna = #{attacker.manna}, blood = #{attacker.blood}"
		puts "#{victim.name} : manna = #{victim.manna}, blood = #{victim.blood}"
		puts "#{attacker.name} : = #{attacker.manna}, blood = #{attacker.blood}"

		if victim.blood = 0 || attacker.blood = 0
			puts "Game Over"
		end
	end
end
