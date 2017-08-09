require 'gosu'

class GameWindow < Gosu::Window 
	def initialize width = 800, height = 600
		super width, height
		self.caption = 'Test Game'
		@cursor = Cursor.new(self, true)
	end

	def update
		Game.scene.update
	end

	def draw
		Game.scene.draw
		Graphics.latest
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