require 'docking_station'
describe DockingStation do

subject(:docking_station) {described_class.new}
let(:bike) {double :bike}

  describe '#release_bike' do
    before do
      allow(bike).to receive(:working).and_return true
    end


    it 'releases a working bike' do
      docking_station.dock(bike)
      expect(docking_station.release_bike(bike)).to eq bike
    end

    it 'raise error when no bike in docking station' do
      expect{docking_station.release_bike(bike)}.to raise_error("No bikes available")

    end
  end

  describe '#dock' do
    it 'returns a docked bike' do
      expect(docking_station.dock(bike)).to include bike
    end

    it 'cannot exceed docking capacity' do
      20.times{docking_station.dock(bike)}
      expect{docking_station.dock(bike)}.to raise_error "Docking station full"
    end

    context 'broken bike' do
      before do
        allow(bike).to receive(:working).and_return false
        docking_station.dock(bike)
      end

      it 'broken bikes are not released' do
        expect{docking_station.release_bike(bike)}.to raise_error "Bike broken"
      end
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
