require 'gosu'

class Spriteset_Map
	def initialize
		@character_sprites = Array.new
		@character_sprites.push(Sprite_Character.new($game_player))
		update
	end

	def dispose
		@character_sprites.reject! do |sprite|
			true
		end
	end

	def update
		for sprite in @character_sprites
			sprite.update
		end
	end

	def draw
		for sprite in @character_sprites
			sprite.draw
		end
	end
end