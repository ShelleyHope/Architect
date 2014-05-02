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

  	it "is not full when it is holding less than capacity" do
  		expect(airport).not_to be_full
  	end

  	it "is full when it has reached its capacity (of six planes)" do
  		expect(airport_with_six_planes).to be_full
  	end
	
    it "should not land a plane when the airport is full" do
      expect{airport_with_six_planes.land(:plane)}.to raise_error "DENIED"
    end
  end
  
  context "landing in good weather" do
  	let(:sky) { double :sky, :weather? => "sunny" }
  	let(:airport) { Airport.new([], sky) }
   
  	it "should land the plane in good weather" do
  		plane = Plane.new 
  		airport.land(plane)
  		expect(plane.flying?).to be_false
  		expect(airport).to have_planes
  	end
  end

  context "landing in stormy weather" do
    let(:sky)     { double :sky, :weather? => "stormy" }
    let(:airport) { Airport.new([], sky) }
  
    it "should not land a plane in stormy weather" do
      plane = Plane.new
      expect{airport.land(plane)}.to raise_error "Stormy"
    end
  end

  context "taking off in good weather" do
    let(:sky)                     { double :sky, :weather? => "sunny" }
    let(:plane)                   { Plane.new  }
    let(:airport)                 { Airport.new([plane], sky) }
    
    it "should allow planes to take off" do
      expect(airport.take_off(plane)).to be_true
      expect(airport).not_to have_planes
      expect(plane.flying?).to be_true
    end
  end
end