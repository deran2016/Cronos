require 'gosu'

class Scene_Map

	def initialize
		#
	end

	def update
		#
	end

	def draw
		#
	end

	def receive_input input
		#
	end

	private

	def delta_attributes input
		if input == Gosu::KbLeft
			{ y: 0, x: -1}
		elsif input == Gosu::KbRight
			{ y: 0, x: 1}
		elsif input == Gosu::KbUp
			{ y: -1, x: 0}
		elsif input == Gosu::KbDown
			{ y: 1, x: 0}
		else
			{ y: 0, x: 0}
		end
	end

	def move
		#
	end
end