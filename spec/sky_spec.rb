require "sky"

describe Sky do
  
let(:sky) { Sky.new }

  it "is sunny to begin with" do
		sky.stub(:rand).with(1..10){8}
	  expect(sky.weather?).to eq "sunny"
  end

  it "changes to stormy very occasionally" do
  	sky.stub(:rand).with(1..10){9}
  	expect(sky.weather?).to eq "stormy"
  end

end