class GameWindow < Gosu::Window

	def initialize
		super(720, 720, false)
		self.caption = "Gosu"
		@background = Gosu::Image.new(self, 'media/background.png', false)
		@player = Player.new(self)
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
				@x_target += 24
			end
		end

		if button_down?(Gosu::KbLeft)
			if @player.x_pos == @x_target
				@x_target += -24
			end
		end
		
		if button_down?(Gosu::KbUp)
			if @player.y_pos == @y_target
				@y_target += -24
			end
		end
		
		if button_down?(Gosu::KbDown)
			if @player.y_pos == @y_target
				@y_target += 24
			end
		end

		@player.move(@x_target, @y_target)
	end

	def draw
		@background.draw(0, 0, 0)
		@player.draw
	end

end
