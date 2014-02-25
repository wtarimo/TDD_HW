#Author: William Tarimo
#COSI236B - TDD_HW
#2/23/2014

class Scene
	attr_reader :shapes

	def initialize shapes=[]
		@shapes = shapes
	end

	def shape_count
		#Counts how many shapes there are
		@shapes.size
	end

	def total_area
		#sum of all the areas even if they overlap; doesn’t worry about computing intersections.
		area = 0
		@shapes.each {|shape|
			area+=shape.area
		}
		return area
	end

	def add_shape shape
		#Adds shape to the scene
		@shapes.push shape
	end

	def remove_shape shape
		#Removes shape from the scene
		@shapes.delete_if {|item| item==shape}
	end
end