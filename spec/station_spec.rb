require 'station'

describe Station do

  let(:oyster){ double(:oyster) }

  describe '#initialization' do
    it 'sets name' do
      station = Station.new("old street", 1)
      expect(station.name).to eq "old street"
    end
    it 'sets zone' do
      station = Station.new("old street", 1)
      expect(station.zone).to eq 1
    end
  end
    # it 'knows user is touched in' do
    #   oyster.touch_in
    #   expect(subject.cards).to include oyster
    # end
  end
