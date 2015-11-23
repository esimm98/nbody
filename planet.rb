require 'gosu'

class Planet

	G = 6.67408*10**-11

	def initialize(xpos, ypos, xvel, yvel, mass, file)
		@xpos = xpos
		@ypos = ypos
		@xvel = xvel
		@yvel = yvel
		@mass = mass
		@image = Gosu::Image.new("images/#{file}")
		@net_force = 0
	end

	def draw
		@image.draw(@xpos, @ypos, ZOrder::Planets)
	end

end