require "sky"
require "plane"

class Airport

	def initialize(planes=[], sky = Sky.new, capacity=6)
		@planes = planes
		@capacity = capacity
		@sky = sky
	end

	def has_planes?
		plane_count > 0
	end

  def full?
    plane_count == @capacity
	end

  def plane_count
  	@planes.count
  end
  
  def land(plane)
  	raise "DENIED" if full?
  	raise "Stormy" if @sky.weather? != "sunny"
    plane.land!
    @planes<<plane
    self
  end

  def take_off(plane)
    raise "Stormy" if @sky.weather? != "sunny"
    plane.take_off!
    @planes.delete(plane)
  end

end