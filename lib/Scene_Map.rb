require 'gosu'

class Scene_Map

	def initialize
		$game_player = Game_Player.new
		$scene 	= "Scene_Map"
		@spriteset = Spriteset_Map.new
	end

	def update
		$game_player.update
		@spriteset.update
	end

	def draw
		@spriteset.draw
	end

	def receive_input input

	end

	private

	def tranfer_player
		#
		@spriteset = Spriteset_Map.new
	end
end