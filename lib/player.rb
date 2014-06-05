class Player < MovingObject

	def initialize()
		super
		@sprite = [$spritesheet[8], $spritesheet[9]]
	end

	def path_clear(x_target, y_target)
		if $game_window.cave.cells["#{x_target} #{y_target}"].nil? or
		   $game_window.cave.cells["#{x_target} #{y_target}"].state == :blocking
		   	return false
		else
			return true
		end
	end

	def action(action)

		if action == :up
			if @y_pos == @y_target
				if path_clear(@x_target, @y_target - 24)
					@y_target += -24
				end
			end
		end
		
		if action == :down
			if @y_pos == @y_target
				if path_clear(@x_target, @y_target + 24)
					@y_target += 24
				end
			end
		end

		if action == :right
			if @x_pos == @x_target
				if path_clear(@x_target + 24, @y_target)
					@x_target += 24
				end
			end
		end

		if action == :left
			if @x_pos == @x_target
				if path_clear(@x_target - 24, @y_target)
					@x_target += -24
				end
			end
		end

	end

	def draw()
		@sprite[Gosu::milliseconds / 500 % 2].draw(@x_pos, @y_pos, 99)
	end

end
