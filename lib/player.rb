class Player < MovingObject

	def initialize()
		super
		@sprite = [$spritesheet[2], $spritesheet[3]]
	end

	def draw()
		@sprite[Gosu::milliseconds / 500 % 2].draw(@x_pos, @y_pos, 99)
	end

end
