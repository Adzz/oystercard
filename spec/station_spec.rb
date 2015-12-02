require 'station'


describe Station do


  it "Has a zone attribute" do
    station = Station.new("Kings Cross", 2)
    expect(station.zone).to eq 2
  end

  it "Has a name attribute" do
    station = Station.new("Kings Cross", 2)
    expect(station.name).to eq "Kings Cross"

  end


end
