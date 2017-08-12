require 'gosu'

class Cursor
    attr_reader :visible

    def initialize(window, visible)
        @window = window # window to draw a mouse_image
        @visible = visible # visible?
        @mouse_image = Gosu::Image.new("./graphics/icons/Mouse.png") # load a mouse_image
    end

    def visible?
        visible
    end

    def draw
        if @visible
            @mouse_image.draw(@window.mouse_x, @window.mouse_y, 100) # draw a mouse_image
        end
    end
end