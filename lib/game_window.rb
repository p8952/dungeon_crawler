class GameWindow < Gosu::Window

	def initialize()
		super(720, 720, false)
		self.caption = "Gosu"
	
		$spritesheet = Gosu::Image.load_tiles(self, 'media/spritesheet.png', 24, 24, false)
		$game_objects = []
		$cave = Cave.new(720, 720)
		
		@player = Player.new()
		5.times { Creep.new() }
	end

	def update()
		close if button_down?(Gosu::KbEscape)
		@player.action(:up) if button_down?(Gosu::KbUp)
		@player.action(:down) if button_down?(Gosu::KbDown)
		@player.action(:right) if button_down?(Gosu::KbRight)
		@player.action(:left) if button_down?(Gosu::KbLeft)

		$game_objects.each { |obj| obj.update }
	end

	def draw()
		$game_objects.each { |obj| obj.draw }
	end

end
