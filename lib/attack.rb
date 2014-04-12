class Attack

	attr_accessor :x_target, :y_target
	
	def initialize(x_pos, y_pos, direction, range)
		@sprite = $spritesheet[18]
		@x_pos = (x_pos / 24).to_f.round * 24
		@y_pos =  (y_pos / 24).to_f.round * 24

		if direction == :north
			@x_target = @x_pos
			@y_target = @y_pos - (range * 24)
		elsif direction == :south
			@x_target = @x_pos
			@y_target = @y_pos + (range * 24)
		elsif direction == :east
			@x_target = @x_pos + (range * 24)
			@y_target = @y_pos
		elsif direction == :west
			@x_target = @x_pos - (range * 24)
			@y_target = @y_pos
		end

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
		
		if @x_pos == @x_target and @y_pos == @y_target
			$game_objects.delete(self)
		end

	end

	def draw
		@sprite.draw(@x_pos, @y_pos, 99)
	end

end
