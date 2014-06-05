class MovingObject < StaticObject
	
	attr_accessor :x_target, :y_target

	def initialize()
		super
		@x_target = 0
		@y_target = 0
		@speed = 1
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
	
end
