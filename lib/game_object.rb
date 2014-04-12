class GameObject
	
	attr_accessor :sprite, :x_pos, :y_pos, :x_target, :y_target, :speed

	def initialize()
		@sprite = $spritesheet[16]
		@x_pos = 0
		@y_pos = 0
		@x_target = 0
		@y_target = 0
		@speed = 1
		$game_objects << self
	end

	def update()
		
		if @y_pos > @y_target
			@y_pos += -@speed
		end

		if @y_pos < @y_target
			@y_pos += @speed
		end

		if @x_pos < @x_target
			@x_pos += @speed
		end
		
		if @x_pos > @x_target
			@x_pos += -@speed
		end
			
	end
	
	def draw
		@sprite.draw(@x_pos, @y_pos, 99)
	end

end
