#Author: William Tarimo
#COSI236B - TDD_HW
#2/23/2014

class Rectangle
	attr_reader :coords

	def initialize p1,p2
		@coords = [p1,p2]
	end

	def valid?
		#Checks if the object is a valid rectangle
		@coords[0].valid? && @coords[0].valid? && @coords[0].class == Point && @coords[1].class == Point
	end

	def area
		#Returns area of the rectangle
		if valid?
			(@coords[1].X - @coords[0].X).abs * (@coords[1].Y - @coords[0].Y).abs
		end
	end
end