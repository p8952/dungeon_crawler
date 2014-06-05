class Creep < MovingObject

	def initialize()
		super
		@sprite = [$spritesheet[4], $spritesheet[5]]
	end

	def update()
		super
		
		case rand(250)
		when 0
			self.action(:up)
		when 1
			self.action(:down)
		when 2
			self.action(:right)
		when 3
			self.action(:left)
		else
			# Do Nothing
		end	
	end

	def draw()
		@sprite[Gosu::milliseconds / 500 % 2].draw(@x_pos, @y_pos, 99)
	end

end
