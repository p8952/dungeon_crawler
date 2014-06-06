class Creep < MovingObject

	def initialize()
		super
		@sprite = [$spritesheet[4], $spritesheet[5]]

		@x_pos = (rand(720) / 24).round * 24
		@y_pos = (rand(720) / 24).round * 24
		until path_clear(@x_pos, @y_pos)
			@x_pos = (rand(720) / 24).round * 24
			@y_pos = (rand(720) / 24).round * 24
		end

		@x_target = @x_pos
		@y_target = @y_pos
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
