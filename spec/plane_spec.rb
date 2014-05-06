require "plane"

describe "Plane" do

 let(:plane) 		    { Plane.new        }
 let(:landed_plane) { Plane.new("landed") }

  it "is flying when created" do
  	expect(plane.flying?).to eq "flying"
  end

  it "can take off" do
    expect(landed_plane.take_off!).to eq "flying"
  end

  it "can land" do
	  expect(plane.land!).to eq "landed"
  end 
end
