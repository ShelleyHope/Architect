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


  # def check_sky
  # 	@check = Sky.new
  #   @check.weather?
  # end

  # def accept_landing!
  # 	@planes.unshift(Plane.new.land!)
  # 	self
  # end  

  # def check_planes
  # 	@planes.each do |plane| 
  # 		plane = "landed"
  #   end
  # end

  # def permission_to_take_off?
  # 	raise "DENIED" if check_sky == "stormy"
  #   true
  # end

  # def accept_take_off!
  #   @planes.shift(Plane.new)
  # end

end