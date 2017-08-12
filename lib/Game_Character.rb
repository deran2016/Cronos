class Game_Character
	attr_reader 	:id
	attr_reader 	:x, :y
	attr_reader 	:character_name
	attr_accessor 	:direction
	attr_reader		:anime_count

	def initialize
		@id = 0
		@x = 0
		@y = 0
		@character_name = ""
		@direction = 2
		@move_speed = 5
		@anime_count = 0
	end

	def moving?
		return true # temporary
	end

	def stop_moving
		@anime_count = 0
	end

	def passable? x, y, d
		new_x = x + (d == 6 ? 1 : d == 4 ? -1 : 0)
		new_y = y + (d == 2 ? 1 : d == 8 ? -1 : 0)
		# TODO : handle passability
		return true # temporary
	end

	def moveto x, y
		@x = x
		@y = y
	end

	def update
		if moving?
			if @anime_count > 4
				@anime_count = 0
			end
			@anime_count += 1
		else
			@anime_count = 0
		end
	end

	def move_down turn_enabled = true
		if turn_enabled
			turn_down
		end
		if passable?(@x, @y, 2)
			turn_down
			@y += 1
		end
	end

	def move_left turn_enabled = true
		if turn_enabled
			turn_left
		end
		if passable?(@x, @y, 2)
			turn_left
			@x -= 1
		end
	end

	def move_right turn_enabled = true
		if turn_enabled
			turn_right
		end
		if passable?(@x, @y, 2)
			turn_right
			@y += 1
		end
	end

	def move_up turn_enabled = true
		if turn_enabled
			turn_right
		end
		if passable?(@x, @y, 2)
			turn_right
			@x += 1
		end
	end

	def move_lower_left
		@direction = (@direction == 6 ? 4 : @direction == 8 ? 2 : @direction)
		if (passable?(@x, @y, 2) and passable?(@x, @y + 1, 4)) or
			(passable?(@x, @y, 4) and passable?(@x - 1, @y, 2))
			@x -= 1
			@y += 1
		end
	end

	def move_lower_right
		@direction = (@direction == 4 ? 6 : @direction == 8 ? 2 : @direction)
		if (passable?(@x, @y, 2) and passable?(@x, @y + 1, 6)) or
			(passable?(@x, @y, 6) and passable?(@x - 1, @y, 2))
			@x += 1
			@y += 1
		end
	end

	def move_upper_left
		@direction = (@direction == 6 ? 4 : @direction == 2 ? 8 : @direction)
		if (passable?(@x, @y, 8) and passable?(@x, @y + 1, 4)) or
			(passable?(@x, @y, 4) and passable?(@x - 1, @y, 8))
			@x -= 1
			@y -= 1
		end
	end

	def move_upper_right
		@direction = (@direction == 4 ? 6 : @direction == 2 ? 8 : @direction)
		if (passable?(@x, @y, 8) and passable?(@x, @y + 1, 6)) or
			(passable?(@x, @y, 6) and passable?(@x - 1, @y, 8))
			@x += 1
			@y -= 1
		end
	end

	def turn_down
		@direction = 2
	end

	def turn_left
		@direction = 4
	end

	def turn_right
		@direction = 6
	end

	def turn_up
		@direction = 8
	end
end