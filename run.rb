require_relative "zorder"
require_relative "planet"
require 'gosu'

class SimWindow < Gosu::Window

	attr_accessor :window_size, :diameter

	def initialize
		@window_size = 600
		super @window_size, @window_size
		self.caption = "Planet Orbit Sim"
		@background = Gosu::Image.new("images/space.jpg")
		@bodies = []
		@line = 0
		@diameter = 0

		file = File.read("simulations/planets.txt")
		file.each_line do |line|
			arr = line.split(' ')
			if @line == 1
				@diameter = arr[0].to_f * 2
			elsif @line >= 2
				@bodies.push << Planet.new(arr[0].to_f, arr[1].to_f, arr[2].to_f, arr[3].to_f, arr[4].to_f, arr[5], self)
			end
			@line += 1
		end
	end

	def draw
		@background.draw(0, 0, ZOrder::Background)
		@bodies.each { |body| body.draw }
	end

	def update
		@bodies.each do |i|
			@bodies.each do |j|
				if i != j
					i.calc_gravity(j)
				end
			end
			i.calc_acceleration
			i.calc_velocity
			i.calc_position
		end
	end

	def button_down(id)
		close if id == Gosu::KbEscape
	end
end

system = SimWindow.new
system.show