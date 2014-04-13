class StaticObject
	
	attr_accessor :sprite, :x_pos, :y_pos, :state

	def initialize()
		@sprite = $spritesheet[16]
		@x_pos = 0
		@y_pos = 0
		@state = :blocking
		$game_objects << self
	end

	def draw()
		@sprite.draw(@x_pos, @y_pos, 99)
	end

end
