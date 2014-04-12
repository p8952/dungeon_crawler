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

	def button_down(id)
		close if id == Gosu::KbEscape
		@player.action(:attack_close) if id == Gosu::KbA
		@player.action(:attack_far) if id == Gosu::KbD
	end

	def update
		@player.action(:up) if button_down?(Gosu::KbUp)
		@player.action(:down) if button_down?(Gosu::KbDown)
		@player.action(:right) if button_down?(Gosu::KbRight)
		@player.action(:left) if button_down?(Gosu::KbLeft)

		$game_objects.each { |obj| obj.update }
	end

	def draw
		@cave.draw
		$game_objects.each { |obj| obj.draw }
	end

end
