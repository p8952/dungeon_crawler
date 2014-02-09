class DungeonGenerator
	attr_accessor :rooms

	def initialize(game_window)
		
		# Start generating new rooms, rejecting ones which are out of bounds
		# or overlap existing rooms
		@rooms = []
		@counter = 0
		until @rooms.length == 5
			
			# If we can't fit all the rooms in after 1000 attempts
			# clear the current dungeon and start again
			if @counter > 1000
				@rooms.clear
				@counter = 0
			else
				@counter += 1
			end

			@new_room = Room.new(game_window)
			@usable = true
			
			# Reject if room is out of bounds on the x-axis
			if (@new_room.x_origin + @new_room.width + 24) > 720
				@usable = false
			end

			# Reject if room is out of bounds on the y-axis
			if (@new_room.y_origin - @new_room.height - 24) < 0
				@usable = false
			end
		
			@rooms.each do |room|
				# Reject if room overlaps an existing room on the x-axis
				unless @new_room.x_origin > (room.x_origin + room.width + 24) or
					(@new_room.x_origin + @new_room.width + 24) < room.x_origin
					# Reject if room overlaps an existing room on the y-axis
					unless @new_room.y_origin < (room.y_origin - room.height - 24) or
						(@new_room.y_origin - @new_room.height - 24) > room.y_origin
						@usable = false
						break
					end
				end
			end

			# If a usable room is found, add it to the array of rooms
			if @usable == true
				@rooms << @new_room
			end

		end
	end

	def draw
		@rooms.each do |room|
			room.draw
		end
	end

end

class Room
	attr_accessor :x_origin, :y_origin, :width, :height, :walls

	def initialize(game_window)
		@game_window = game_window
		
		@x_origin = (((rand(720) / 24).round * 24) + 24)
		@y_origin = (((rand(720) / 24).round * 24) + 24)
		@width = ((rand(5) + 5) * 24)
		@height = ((rand(5) + 5) * 24)
		
		@walls = []

		(@width / 24).times do |x|
			@walls << Wall.new(game_window, (@x_origin + (x * 24)), (@y_origin - @height))
		end

		(@width / 24).times do |x|
			@walls << Wall.new(game_window, (@x_origin + (x * 24)), (@y_origin -24))
		end

		(@height / 24).times do |y|
			@walls << Wall.new(game_window, @x_origin, ((@y_origin - @height) + (y * 24)))
		end
	
		(@height / 24).times do |y|
			@walls << Wall.new(game_window, ((@x_origin + @width) - 24), ((@y_origin - @height) + (y * 24)))
		end

	end

	def draw
		@walls.each do |wall|
			wall.draw
		end
	end

end

class Wall
	attr_accessor :x_origin, :y_origin

	def initialize(game_window, x_origin, y_origin)
		@wall = Gosu::Image.new(game_window, 'media/wall.png', false)
		@x_origin = x_origin
		@y_origin = y_origin
	end

	def draw
		@wall.draw(x_origin, y_origin, 3)
	end

end
