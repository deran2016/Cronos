require 'gosu'

class Sprite_Character
	attr_accessor :character

	def initialize window, character = nil
		@character = character
		@character_name = @character.character_name
		@character_image = Gosu::Image.new("./graphics/characters/" + @character_name +"png")
	end

	def update
		if @character_name != @character.character_name
			if moving?
				#
			else
				#
			end
		end
	end

	def draw
		#
	end
end