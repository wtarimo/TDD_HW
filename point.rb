#Author: William Tarimo
#COSI236B - TDD_HW
#2/23/2014

class Point
	attr_reader :X, :Y

	def initialize x,y
		@X = x
		@Y = y
	end

	def valid?
		#Checks if the object is a valid x,y point with floats for x,y
		@X.to_f==@X && @Y.to_f==@Y && @X >= 0.0 && @Y>=0.0
	end
end