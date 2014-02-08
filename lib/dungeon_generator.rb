class DungeonGenerator
	
	def initialize(game_window)
		
		# Create an array of rooms and add the first room
		@rooms = []
		@rooms << Room.new(game_window)

		# Start generating new rooms, rejecting ones which are out of bounds
		# or overlap existing rooms
		until @rooms.length == 5
			@new_room = Room.new(game_window)
			@usable = true
			
			# Reject if room is out of bounds on the x-axis
			if (@new_room.x_origin + @new_room.width) > 720
				@usable = false
			end

			# Reject if room is out of bounds on the y-axis
			if (@new_room.y_origin - @new_room.height) < 0
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
	attr_accessor :x_origin, :y_origin, :width, :height

	def initialize(game_window)
		@game_window = game_window
		@COLOR = Gosu::Color.new(0xFF1EB1FA)
		@x_origin = ((rand(720) / 24).round * 24)
		@y_origin = ((rand(720) / 24).round * 24)
		@width = (rand(10) + 5) * 24
		@height = (rand(10) + 5) * 24
	end

	def draw
		@game_window.draw_quad(
			@x_origin, @y_origin, @COLOR,
			(@x_origin + @width), @y_origin, @COLOR,
			@x_origin, (@y_origin - @height), @COLOR,
			(@x_origin + @width), (@y_origin - @height), @COLOR,
			1
		)
	end

end
