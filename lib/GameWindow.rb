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
			@camera_x = [[$game_player.x - width / 2, 0].max, 800 * 50 - width].min
			@camera_y = [[$game_player.y - height / 2, 0].max, 600 * 50 - height].min
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