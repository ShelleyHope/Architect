# # grand final
# # Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# # Be careful of the weather, it could be stormy!
# # Check when all the planes have landed that they have the right status "landed"
# # Once all the planes are in the air again, check that they have the status of flying!
# describe "The gand finale (last spec)" do
#   it 'all planes can land and all planes can take off' do
#   end
# end

require "airport.rb"
require "sky.rb"
require "plane.rb"


describe "Grand_Finale" do

	it "allows six planes to land at the airport" do
		busy_airport = Airport.new.accept_landing!.accept_landing!.accept_landing!.accept_landing!.accept_landing!.accept_landing!
		expect(busy_airport).to be_full
		puts busy_airport.inspect
	end
  
  it "checks that the planes have a 'landed' status" do
  	busy_airport = Airport.new.accept_landing!.accept_landing!.accept_landing!.accept_landing!.accept_landing!.accept_landing!
  	expect(busy_airport.check_planes).to eq ["landed", "landed", "landed", "landed", "landed", "landed"]
  end

  it "allows the planes to take off" do
  	busy_airport = Airport.new.accept_landing!.accept_landing!.accept_landing!.accept_landing!.accept_landing!.accept_landing!
  	empty_airport = busy_airport.accept_take_off!.accept_take_off!.accept_take_off!.accept_take_off!.accept_take_off!.accept_take_off!
	  expect(empty_airport.plane_count).to eq 0
	end

end