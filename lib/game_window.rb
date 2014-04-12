class GameWindow < Gosu::Window

	attr_accessor :cave

	def initialize
		super(720, 720, false)
		self.caption = "Gosu"
	
		$spritesheet = Gosu::Image.load_tiles(self, 'media/spritesheet.png', 24, 24, false)
		$game_objects = []
		
		@cave = Cave.new(720, 720)
		@player = Player.new()
	end

	def update
		if button_down?(Gosu::KbEscape)
			close
		end

		if button_down?(Gosu::KbUp)
			@player.move(:up)
		end
		
		if button_down?(Gosu::KbDown)
			@player.move(:down)
		end

		if button_down?(Gosu::KbRight)
			@player.move(:right)
		end

		if button_down?(Gosu::KbLeft)
			@player.move(:left)
		end

		$game_objects.each { |obj| obj.update }
	end

	def draw
		@cave.draw
		$game_objects.each { |obj| obj.draw }
	end

end
