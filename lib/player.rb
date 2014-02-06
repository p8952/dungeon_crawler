class Player

	def initialize(game_window)
		@image = Gosu::Image.new(game_window, 'media/player.png', false)
		@x_pos = 320
		@y_pos = 240
		@speed = 1
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
