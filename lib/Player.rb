class Player

	def initialize character_name = "001-Fighter01"
		@character_name = character_name
		@image = Gosu::Image.new("./graphics/characters/" + character_name + "png")
		@x = @y = @z = 0.0
	end

	def passable? x, y, d
		new_x = x		
	end
end