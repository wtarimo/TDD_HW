require  'minitest/autorun'

class Point
	attr_reader :X, :Y

	def initialize x,y
		@X = x
		@Y = y
	end

	def valid?
		@X.to_f==@X && @Y.to_f==@Y && @X >= 0.0 && @Y>=0.0
	end
end

describe Point do
	before do
		@point = Point.new rand*14,rand*14
	end

	it 'Is a Valid Point' do
		@point.valid?.must_equal true
	end
	
end


class Rectangle
	attr_reader :coords

	def initialize p1,p2
		@coords = [p1,p2]
	end

	def valid?
		@coords[0].valid? && @coords[0].valid? && @coords[0].class == Point && @coords[1].class == Point
	end

	def area
		if valid?
			(@coords[1].X - @coords[0].X).abs * (@coords[1].Y - @coords[0].Y).abs
		end
	end
end


describe Rectangle do
	before do
		@rect = Rectangle.new Point.new(2,3),Point.new(10,10)
	end

	it 'Has valid coordinates' do
		@rect.valid?.must_equal true
	end

	it 'can compute area' do
		@rect.area.must_equal 56
	end
	
end

class Triangle
	attr_reader :coords

	def initialize p1,p2,p3
		@coords = [p1,p2,p3]
	end

	def valid?
		@coords[0].valid? && @coords[0].class == Point && @coords[1].valid? && @coords[1].class == Point && @coords[2].valid? && @coords[2].class == Point
	end

	def area
		if valid?
			h = (@coords[1].Y - @coords[0].Y).abs
			b = (@coords[2].X - @coords[1].X).abs
			return h*b.to_f/2
		end
	end
end


describe Triangle do
	before do
		@tri = Triangle.new Point.new(2,3),Point.new(10,10),Point.new(15,15)
	end

	it 'Has valid coordinates' do
		@tri.valid?.must_equal true
	end

	it 'can compute area' do
		@tri.area.must_equal 17.5
	end
	
end


class Circle
	attr_reader :center, :radius

	def initialize c,r
		@center = c
		@radius = r
	end

	def valid?
		@center.class == Point && @center.valid? && @radius.to_f==@radius
	end

	def area
		if valid?
			Math::PI*@radius**2
		end
	end
end


describe Circle do
	before do
		@circle = Circle.new Point.new(2,3),5
	end

	it 'Has a valid center coordinate' do
		@circle.valid?.must_equal true
	end

	it 'can compute area' do
		@circle.area.must_equal 78.53981633974483
	end
	
end

class Scene
	attr_reader :shapes

	def initialize shapes=[]
		@shapes = shapes
	end

	def shape_count
		@shapes.size
	end

	def total_area
		areas = @shapes.collect{|shape| shape.area}
		print areas
		areas.inject(:+)
	end

	def add_shape shape
		@shapes.push shape
	end

	def remove_shape shape
		@shapes.delete_if {|item| item==shape}
	end
end


describe Scene do
	before do
		@scene = Scene.new [Circle.new(Point.new(2,3),5)]
	end

	it 'counts its shapes' do
		@scene.shape_count.must_equal 1
	end

	it 'adds shapes' do
		@scene.add_shape Triangle.new Point.new(2,3),Point.new(10,10),Point.new(15,15)
		@scene.shape_count.must_equal 2
	end

	it 'computes its total area' do
		@scene.total_area.must_equal 96.03981633974483
	end

	it 'removes shapes' do
		@scene.remove_shape Triangle.new Point.new(2,3),Point.new(10,10),Point.new(15,15)
		@scene.shape_count.must_equal 1
	end
	
end