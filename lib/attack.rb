class Attack < GameObject

	def initialize(x_pos, y_pos, direction, range)
		super()
		
		if range == 1
			@sprite = $spritesheet[16]
		else
			@speed = 2
			@sprite = $spritesheet[12]
		end

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
	end

	def update()
		super
		if @x_pos == @x_target and @y_pos == @y_target
			$game_objects.delete(self)
		end
	end

end
