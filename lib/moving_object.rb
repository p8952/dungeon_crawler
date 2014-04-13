class MovingObject < StaticObject
	
	attr_accessor :x_target, :y_target

	def initialize()
		super
		@x_target = 0
		@y_target = 0
		@speed = 1
	end

	def update()

		if @y_pos > @y_target
			@y_pos += -@speed
		end

		if @y_pos < @y_target
			@y_pos += @speed
		end

		if @x_pos < @x_target
			@x_pos += @speed
		end
		
		if @x_pos > @x_target
			@x_pos += -@speed
		end
			
	end
	
end
