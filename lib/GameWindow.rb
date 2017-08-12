require 'gosu'

class GameWindow < Gosu::Window 
	def initialize width = 800, height = 600
		super width, height
		self.caption = 'Test Game'
		@cursor = Cursor.new(self, true)
		@camera_x = @camera_y = 0
	end

	def update
		Game.scene.update
		if $scene == "Scene_Map"
			@camera_x = [0, [$game_player.x - 400, 400].min].max
			@camera_y = [0, [$game_player.y - 300, 300].min].max
		end
	end

	def draw
		Game.scene.draw
		@cursor.draw
	end

	def button_down id
		Game.input_manager.button_down id
	end

	def receive_input input
		close if input == Gosu::KbEscape
		Game.scene.receive_input input
	end
end