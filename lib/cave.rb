class Cave

	attr_accessor :cells

	def initialize(game_window, width, height, spritesheet)
		@cells = {}
		(height / 24).times do |y|
			(width / 24).times do |x|
				@cells["#{(y * 24)} #{(x * 24)}"] = Cell.new(game_window, (y * 24), (x * 24), spritesheet)
			end
		end

		5.times do
			
			pending_wall = []
			pending_ground = []
			
			@cells.each do |pos, cell|
				
				neighbors_filled = 0
				neighbors_filled += 1 if cell.state == 'wall'
				
				cell.get_neighbors.each do |neighbor|
					neighbor = @cells["#{neighbor[0]} #{neighbor[1]}"]
					unless neighbor.nil?
						if neighbor.state == 'wall'
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
		
			pending_wall.each do |cell|
				cell.set_state('wall')
			end
			
			pending_ground.each do |cell|
				cell.set_state('ground')
			end
	
		end

	end

	def draw
		@cells.each do |pos, cell|
			cell.draw
		end
	end

end

class Cell

	attr_accessor :state, :x_pos, :y_pos

	def initialize(game_window, x_pos, y_pos, spritesheet)
		@game_window = game_window
		@x_pos = x_pos
		@y_pos = y_pos
		@spritesheet = spritesheet

		case rand(100) + 1
			when 1..50 then
				set_state('ground')
			when 51..100
				set_state('wall')
		end
		
	end

	def set_state(state)
		unless @state == state
			@state = state
			if state == 'wall'
				@sprite = @spritesheet[10]
			else
				@sprite = @spritesheet[11]
			end
		end
	end

	def get_neighbors
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

	def draw
		@sprite.draw(@x_pos, @y_pos, 0)
	end

end
