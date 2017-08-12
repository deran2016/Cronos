require 'gosu'

class Game_Player < Game_Character
	attr_reader :name

	def update
		super
		move_down if Gosu.button_down? Gosu::KbDown
		move_left if Gosu.button_down? Gosu::KbLeft
		move_right if Gosu.button_down? Gosu::KbRight
		move_up if Gosu.button_down? Gosu::KbUp
	end

	def passable? x, y, d
		new_x = x + (d == 6 ? 1 : d == 4 ? -1 : 0)
		new_y = y + (d == 2 ? 1 : d == 8 ? -1 : 0)
		# TODO : handle passibility
		return true # temporary
		super
	end

	def update_character_name character_name = "001-Fighter01"
		@character_name = character_name
	end
end