class Sky

  def initialize(weather="sunny")
  	@weather = weather
  end

  def weather?
		t = rand(1..10)
		if t > 8
			@weather = "stormy"
	  else
			@weather
	  end
  end	
end