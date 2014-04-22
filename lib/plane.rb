class Plane

	def initialize(status=flying)
		@flying
	end
	
	def has_flying_status?
		@flying = true
	end

	def flying?
		has_flying_status?
		self
	end

	def take_off
		flying?
	end
		
	def land!
		
	end
end