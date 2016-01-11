require 'docking_station'
describe DockingStation do

subject(:docking_station) {described_class.new}
let(:bike) {double :bike}

  describe '#release_bike' do
    it {is_expected.to respond_to :release_bike}

    it 'releases a working bike' do
      docking_station.dock(bike)
      expect(docking_station.release_bike(bike)).to eq bike
    end

    it 'raise error when no bike in docking station' do
      expect{docking_station.release_bike(bike)}.to raise_error("No bikes available")

    end
  end


  it {is_expected.to respond_to(:dock).with(1).argument}

  it {is_expected.to respond_to(:bikes)}


  describe '#dock' do
    it 'returns a docked bike' do
      expect(docking_station.dock(bike)).to include bike
    end

    it 'cannot exceed docking capacity' do
      20.times{docking_station.dock(bike)}
      expect{docking_station.dock(bike)}.to raise_error "Docking station full"
    end
  end

  it 'can change docking station capacity' do
    docking_station.set_capacity(22)
    expect(docking_station.capacity).to eq 22
  end

  it 'default capacity is 20' do
    expect(docking_station.capacity).to eq 20
  end


end
