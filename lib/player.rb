class Player

	def initialize(game_window)
		@image = Gosu::Image.new(game_window, 'media/player.png', false)
		@x_pos = 0
		@y_pos = 0
		@speed = 1
	end

	def get_x
		return @x_pos
	end

	def get_y
		return @y_pos
	end

	def move(x_target, y_target)

		if @x_pos < x_target
			@x_pos += @speed
		end
		
		if @x_pos > x_target
			@x_pos += -@speed
		end
		
		if @y_pos < y_target
			@y_pos += @speed
		end

		if @y_pos > y_target
			@y_pos += -@speed
		end
			
	end
	
	def draw
		@image.draw(@x_pos, @y_pos, 1)
	end

end
