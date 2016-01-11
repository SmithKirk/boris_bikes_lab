require 'docking_station'
describe DockingStation do

subject(:docking_station) {described_class.new}

  it {is_expected.to respond_to :release_bike}

  it 'releases a working bike' do
    bike = docking_station.release_bike
    docking_station.release_bike
    expect(bike).to be_working
  end


  it {is_expected.to respond_to(:dock).with(1).argument}

  it {is_expected.to respond_to(:bike)}

  it 'docks a bike' do
    bike = Bike.new
    docking_station.dock(bike)
    expect(subject.dock(bike)).to eq bike
  end
end
