require_relative "zorder"
require_relative "planet"
require 'gosu'

class SimWindow < Gosu::Window

	def initialize
		@width = 1000
		@height = 600
		super @width, @height
		self.caption = "Planet Orbit Sim"
		@background = Gosu::Image.new("images/space.jpg")
		@planets = []
		@line = 0
		@system_size = 0

		file = File.read("Planets.txt")
		file.each_line do |line|
			arr = line.split(' ')
			if @line == 1
				@system_size = arr[0].to_f*2
			elsif @line >= 2
				arr[0] = arr[0].to_f/@system_size*@width + @width/2
				arr[1] = arr[1].to_f/@system_size*@height + @height/2
				@planets.push << Planet.new(arr[0], arr[1], arr[2].to_f, arr[3].to_f, arr[4].to_f, arr[5])
			end
			@line += 1
		end
	end

	def draw
		@background.draw(0, 0, ZOrder::Background)
		@planets.each { |planet| planet.draw }
	end

	def button_down(id)
		close if id == Gosu::KbEscape
	end
end

window = SimWindow.new
window.show