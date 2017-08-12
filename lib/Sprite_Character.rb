require 'gosu'

class Sprite_Character
	attr_accessor :character

	def initialize character = nil
		@character = character
		@character_name = @character.character_name
		@character_source = Gosu::Image::load_tile("./graphics/characters/" + @character_name +".png", 32, 48)
		@character_anim = @character_source[@character.direction / 2 - 1][@character.anime_sount]
	end

	def update
		if @character_name != @character.character_name
			if moving?
				@character_anim = @character_source[@character.direction / 2 - 1][@character.anime_sount]
			else
				@character_anim = @character_source[@character.direction / 2 - 1][0]
			end
		end
	end

	def draw
		@character_anim.draw(@character.x, @character.y, 99)
	end
end
