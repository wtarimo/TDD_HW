#Author: William Tarimo
#COSI236B - TDD_HW
#2/23/2014

class Circle
	attr_reader :center, :radius

	def initialize c,r
		@center = c
		@radius = r
	end

	def valid?
		#Checks to see if the object is a valid circle
		@center.class == Point && @center.valid? && @radius.to_f==@radius
	end

	def area
		#Returns area of the circle
		if valid?
			Math::PI*@radius**2
		end
	end
end