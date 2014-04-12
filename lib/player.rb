class Player

	attr_accessor :x_pos, :y_pos, :x_target, :y_target

	def initialize()
		@sprite = [$spritesheet[6], $spritesheet[7]]
		@x_pos = 24
		@y_pos = 24
		@x_target = 24
		@y_target = 24
		@speed = 1
		$game_objects << self
	end

	def path_clear(x_target, y_target)
		if $game_window.cave.cells["#{x_target} #{y_target}"].nil? or
		   $game_window.cave.cells["#{x_target} #{y_target}"].state == 'wall'
		   	return false
		else
			return true
		end
	end

	def move(button)

		if button == :up
			if @y_pos == @y_target
				if path_clear(@x_target, @y_target - 24)
					@y_target += -24
				end
			end
		end
		
		if button == :down
			if @y_pos == @y_target
				if path_clear(@x_target, @y_target + 24)
					@y_target += 24
				end
			end
		end

		if button == :right
			if @x_pos == @x_target
				if path_clear(@x_target + 24, @y_target)
					@x_target += 24
				end
			end
		end

		if button == :left
			if @x_pos == @x_target
				if path_clear(@x_target - 24, @y_target)
					@x_target += -24
				end
			end
		end

	end

	def update()

		if @x_pos < @x_target
			@x_pos += @speed
		end
		
		if @x_pos > @x_target
			@x_pos += -@speed
		end
		
		if @y_pos < @y_target
			@y_pos += @speed
		end

		if @y_pos > @y_target
			@y_pos += -@speed
		end
			
	end
	
	def draw
		@sprite[Gosu::milliseconds / 500 % 2].draw(@x_pos, @y_pos, 99)
	end

end
