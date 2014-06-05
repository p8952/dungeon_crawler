class Cave

	attr_accessor :cells

	def initialize(width, height)
		@cells = {}
		(height / 24).times do |y|
			(width / 24).times do |x|
				@cells["#{(y * 24)} #{(x * 24)}"] = Cell.new((y * 24), (x * 24), :blocking)
			end
		end

		5.times do
			
			pending_wall = []
			pending_ground = []
			
			@cells.each do |pos, cell|
				
				neighbors_filled = 0
				neighbors_filled += 1 if cell.state == :blocking
				
				cell.get_neighbors.each do |neighbor|
					neighbor = @cells["#{neighbor[0]} #{neighbor[1]}"]
					unless neighbor.nil?
						if neighbor.state == :blocking
							neighbors_filled += 1
						end
					end
				end

				if neighbors_filled >= 5
					pending_wall << cell
				else
					pending_ground << cell
				end
			
			end
		
			pending_ground.each do |cell|
				cell.set_state(:non_blocking)
			end
	
			pending_wall.each do |cell|
				cell.set_state(:blocking)
			end

		end

	end

	def draw()
		@cells.each do |pos, cell|
			cell.draw
		end
	end

end

class Cell < StaticObject

	attr_accessor :x_pos, :y_pos, :state

	def initialize(x_pos, y_pos, state)
		super()

		@sprite = $spritesheet[10]
		@x_pos = x_pos
		@y_pos = y_pos

		case rand(100) + 1
			when 1..50
				set_state(:non_blocking)
			when 51..100
				set_state(:blocking)
		end
		
	end

	def set_state(state)
		unless @state == state
			@state = state
			if state == :blocking
				@sprite = $spritesheet[10]
			else
				@sprite = $spritesheet[11]
			end
		end
	end

	def get_neighbors()
		return [
			[@x_pos - 24, @y_pos - 24],
			[@x_pos, @y_pos - 24],
			[@x_pos + 24, @y_pos - 24],
			[@x_pos - 24, @y_pos],
			[@x_pos + 24, @y_pos],
			[@x_pos - 24, @y_pos + 24],
			[@x_pos, @y_pos + 24],
			[@x_pos + 24, @y_pos + 24],
		]
	end

	def update()

	end

	def draw()
		@sprite.draw(@x_pos, @y_pos, 0)
	end

end
