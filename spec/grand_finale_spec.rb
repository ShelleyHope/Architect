require "airport.rb"
require "sky.rb"
require "plane.rb"

describe "Grand_Finale" do
	let(:sky) { double :sky, :weather? => "sunny" }
  let(:airport) { Airport.new([], sky) }
	let(:plane) { Plane.new }
	let(:busy_airport) {airport.land(plane).land(plane).land(plane).land(plane).land(plane).land(plane)}
	
	it "allows six planes to land at the airport" do
		expect(busy_airport).to be_full
		expect(plane.flying?).to be_false
	end
  
  it "allows all six planes to take off" do
  	busy_airport.take_off(plane)
    busy_airport.take_off(plane)
    busy_airport.take_off(plane)
    busy_airport.take_off(plane)
    busy_airport.take_off(plane)
    busy_airport.take_off(plane)
  	expect(busy_airport).not_to have_planes
    expect(plane.flying?).to be_true
  end

end