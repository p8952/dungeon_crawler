class GameWindow < Gosu::Window

	def initialize
		super(720, 720, false)
		self.caption = "Gosu"
	
		spritesheet = Gosu::Image.load_tiles(self, 'media/spritesheet.png', 24, 24, false)
		@cave = Cave.new(self, 720, 720, spritesheet)
		@player = Player.new(self, spritesheet)
		@x_target = @player.x_pos
		@y_target = @player.y_pos
	end

	def button_down(id)
		if id == Gosu::KbEscape
			close
		end
	end

	def update
		if button_down?(Gosu::KbRight)
			if @player.x_pos == @x_target
				if path_clear(@x_target + 24, @y_target)
					@x_target += 24
				end
			end
		end

		if button_down?(Gosu::KbLeft)
			if @player.x_pos == @x_target
				if path_clear(@x_target - 24, @y_target)
					@x_target += -24
				end
			end
		end
		
		if button_down?(Gosu::KbUp)
			if @player.y_pos == @y_target
				if path_clear(@x_target, @y_target - 24)
					@y_target += -24
				end
			end
		end
		
		if button_down?(Gosu::KbDown)
			if @player.y_pos == @y_target
				if path_clear(@x_target, @y_target + 24)
					@y_target += 24
				end
			end
		end

		@player.move(@x_target, @y_target)
	end

	def path_clear(x_target, y_target)
		if @cave.cells["#{x_target} #{y_target}"].nil? or
		   @cave.cells["#{x_target} #{y_target}"].state == 'wall'
		   	return false
		else
			return true
		end
	end

	def draw
		@cave.draw
		@player.draw
	end

end
