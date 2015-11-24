require_relative "zorder"
require 'gosu'

class Planet

	attr_accessor :x_pos, :y_pos, :mass

	G = 6.67408e-11

	def initialize(x_pos, y_pos, x_vel, y_vel, mass, file, system)
		@window_size = system.window_size
		@diameter = system.diameter
		@x_pos = x_pos
		@y_pos = y_pos
		@x_relative = scale(x_pos)
		@y_relative = scale(y_pos)
		@x_vel = x_vel
		@y_vel = y_vel
		@mass = mass
		@image = Gosu::Image.new("images/#{file}")
		@x_accel = 0
		@y_accel = 0
		@x_force = 0
		@y_force = 0
		@gravity = 0
	end

	def draw
		@image.draw(@x_relative, @y_relative, ZOrder::Planets)
	end

	def calc_gravity(body)
		x_dist = @x_pos - body.x_pos
		y_dist = @y_pos - body.y_pos
		dist = Math.sqrt(x_dist**2 + y_dist**2)
		@gravity = G*@mass * body.mass / (dist**2)
		@x_force -= (@gravity * x_dist / dist)
		@y_force -= (@gravity * y_dist / dist)
	end

	def calc_acceleration
		@x_accel = @x_force / @mass
		@y_accel = @y_force / @mass
		@x_force = 0
		@y_force = 0
	end

	def calc_velocity
		@x_vel += @x_accel * 100000
		@y_vel += @y_accel * 100000
	end

	def calc_position
		@x_pos += @x_vel * 100000
		@y_pos += @y_vel * 100000
		@x_relative = scale(@x_pos)
		@y_relative = scale(@y_pos*-1)
	end

	private

	def scale(pos)
		pos * @window_size / @diameter + @window_size / 2
	end

end