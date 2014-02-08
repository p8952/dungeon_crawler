class GameWindow < Gosu::Window

	def initialize
		super(720, 720, false)
		self.caption = "Gosu"
		@background = Gosu::Image.new(self, 'media/background.png', false)
		@player = Player.new(self)
		@x_target = @player.get_x
		@y_target = @player.get_y
	end

	def button_down(id)
		if id == Gosu::KbEscape
			close
		end
	end

	def update
		if button_down?(Gosu::KbRight)
			if @player.get_x == @x_target
				@x_target += 24
			end
		end

		if button_down?(Gosu::KbLeft)
			if @player.get_x == @x_target
				@x_target += -24
			end
		end
		
		if button_down?(Gosu::KbUp)
			if @player.get_y == @y_target
				@y_target += -24
			end
		end
		
		if button_down?(Gosu::KbDown)
			if @player.get_y == @y_target
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
