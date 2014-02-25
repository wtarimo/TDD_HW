#Author: William Tarimo
#COSI236B - TDD_HW
#2/23/2014

class Triangle
	attr_reader :coords

	def initialize p1,p2,p3
		@coords = [p1,p2,p3]
	end

	def valid?
		#Checks if the object makes a valid triangle
		@coords[0].valid? && @coords[0].class == Point && @coords[1].valid? && @coords[1].class == Point && @coords[2].valid? && @coords[2].class == Point
	end

	def area
		#Returns area of the triangle
		if valid?
			h = (@coords[1].Y - @coords[0].Y).abs
			b = (@coords[2].X - @coords[1].X).abs
			return h*b.to_f/2
		end
	end
end