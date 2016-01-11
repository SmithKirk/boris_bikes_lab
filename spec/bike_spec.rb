require 'bike'
describe Bike do

subject(:bike) {described_class.new}

  it {is_expected.to respond_to :working?}

  it 'reports broken bike' do
    bike.report
    expect(bike.working).to eq false
  end
end
