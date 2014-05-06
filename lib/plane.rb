class Plane

	def initialize(status="flying")
		@status = status
	end

	def flying?
		@status == "flying"
	end

	def take_off!
		@status = "flying"
	end
		
	def land!
	  @status = "landed"
	end
end