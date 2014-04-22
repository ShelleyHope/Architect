require "runway.rb"

describe "Runway" do
  
  it "can be empty" do
  	expect(Runway.new).not_to have_plane
  end

	it "can hold a plane" do
		runway_with_plane = Runway.new (:plane)
		expect(runway_with_plane).to have_plane
	end

	# it "will refuse request from airport to accept plane when occupied" do
	# 	runway_with_plane = Runway.new (:plane)
	# 	expect(runway_with_plane.accept_plane?).to raise_error(RuntimeError)
	# end
	
end