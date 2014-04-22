class Runway

	def initialize(plane=nil)
		@plane = plane
	end

	def has_plane?
		!@plane.nil?
	end


	# def accept_plane?
	# 	raise "Runway occupied"

	# end


end