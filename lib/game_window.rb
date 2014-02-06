class GameWindow < Gosu::Window

	def initialize
		super(720, 720, false)
		self.caption = "Gosu"
		@player = Player.new(self)
		@background = Gosu::Image.new(self, 'media/background.png', false)
		@flag = Gosu::Image.new(self, 'media/flag.png', false)
		@x_click = 320
		@y_click = 240
	end

	def button_down(id)
		
		if id == Gosu::KbEscape
			close
		end

		if id == Gosu::MsLeft
			@x_click = (((self.mouse_x / 24).round) * 24)
			@y_click = (((self.mouse_y / 24).round) * 24)
		end

	end

	def update
		@player.move(@x_click, @y_click)
	end

	def draw
		@background.draw(0, 0, 0)
		@flag.draw(@x_click, @y_click, 1)
		@flag.draw((((self.mouse_x / 24).round) * 24), (((self.mouse_y / 24).round) * 24), 1)
		@player.draw
	end

end
