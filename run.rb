require_relative "zorder"
require 'gosu'

class GameWindow < Gosu::Window

	def initialize
		super 1000, 1000
		self.caption = "Planet Orbits Thingy"
		@background = Gosu::Image.new("images/space.jpg")
		G = 6.67408*10**-11
		planets = []

		file = File.read("Planets.txt")
		file.each_line do |i|

		end
	end

	def draw
		@background.draw(0, 0, ZOrder::Background)
	end

	def make 

	end

	def button_down(id)
		close if id == Gosu::KbEscape
	end

end

window = GameWindow.new
window.show