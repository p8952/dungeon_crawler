class Player

	attr_accessor :x_pos, :y_pos

	def initialize()
		@sprite = [$spritesheet[6], $spritesheet[7]]
		@x_pos = 24
		@y_pos = 24
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
		@sprite[Gosu::milliseconds / 500 % 2].draw(@x_pos, @y_pos, 99)
	end

end
