require "airport"
require "plane"

describe "Airport" do

	context "capacity tests" do

		let(:airport)                 { Airport.new }
   	let(:airport_with_planes)     { Airport.new ([:plane, :plane]) }
   	let(:airport_with_six_planes) { Airport.new([:plane, :plane, :plane, :plane, :plane, :plane,]) }

		it "is empty when built" do
  		expect(airport).not_to have_planes
  	end

		it "holds planes" do
			expect(airport_with_planes).to have_planes
		end

  	it "is not full" do
  		expect(airport).not_to be_full
  	end

  	it "is full when it has reached its capacity (of six planes)" do
  		expect(airport_with_six_planes).to be_full
  	end
	end
  
  context "landing planes in good weather" do

  	let(:sky) { double :sky, :weather? => "sunny" }
  	let(:airport) { Airport.new([], sky) }
    let(:plane) { double :plane  }
    let(:airport_with_six_planes) { Airport.new([:plane, :plane, :plane, :plane, :plane, :plane,], sky) }

  	it "should land the plane in good weather" do
  		plane = Plane.new 
  		airport.land(plane)
  		expect(plane.flying?).to be_false
  		expect(airport).to have_planes
  	end

  	it "should not land a plane even in good weather if the airport is full" do
  	
			expect{airport_with_six_planes.land(:plane)}.to raise_error "DENIED"
    end


  end

  context "stormy weather" do
  
  it "should not land a plane in stormy weather" do
    
  end

  end



#   let(:airport)                 { Airport.new }
#   let(:airport_with_planes)     { Airport.new ([:plane, :plane]) }
#   let(:airport_with_six_planes) { Airport.new ([:plane, :plane, :plane, :plane, :plane, :plane,])}



# context	"random weather"

# # the below tests pass occasionally as expected

#   it "checks whether the sky is sunny" do
#  	  expect(airport.check_sky).to eq "sunny"
#   end
  
#   it "checks whether the sky is stormy" do
#   	expect(airport.check_sky).to eq "stormy"
#   end
 
# context "landing planes"

#   it "allows a plane to land when it is sunny and the airport is not full" do
# 		expect(airport_with_planes.permission_to_land?).to be true
# 	end

# 	it "denies permission to land when full" do
#     expect{airport_with_six_planes.permission_to_land?}.to raise_error "DENIED"
# 	end


#   it "denies permission to land when the sky is stormy" do
#   	expect{airport.permission_to_land?}.to raise_error "DENIED"
#   end


#   it "has a plane after one lands" do
#   	expect(airport.accept_landing!.plane_count).to eq 1
#   end

#   it "allows a plane to take off if the sky is sunny" do
#   	expect{airport.permission_to_take_off?}.to raise_error "OK"
#   end
end