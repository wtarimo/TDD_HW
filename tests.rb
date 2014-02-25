#Author: William Tarimo
#COSI236B - TDD_HW
#2/23/2014

require  'minitest/autorun'
require_relative 'point'
require_relative 'rectangle'
require_relative 'triangle'
require_relative 'circle'
require_relative 'scene'

describe Point do
	before do
		@point = Point.new rand*14,rand*14
	end

	it 'Is a Valid Point' do
		@point.valid?.must_equal true
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


describe Scene do
	before do
		@scene = Scene.new [Circle.new(Point.new(2,3),5)]
		@tri = Triangle.new Point.new(2,3),Point.new(10,10),Point.new(15,15)
		@scene.add_shape @tri
		@rect = Rectangle.new Point.new(2,3),Point.new(10,10)
	end

	it 'counts its shapes' do
		@scene.shape_count.must_equal 2
	end

	it 'computes its total area' do
		@scene.total_area.must_equal 96.03981633974483
	end

	it 'adds shapes' do
		@scene.add_shape @rect
		@scene.shape_count.must_equal 3
	end

	it 'removes shapes' do
		@scene.add_shape @rect
		@scene.remove_shape @tri
		@scene.shape_count.must_equal 2
	end
	
end