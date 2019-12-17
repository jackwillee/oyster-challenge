require 'oystercard'
describe Oystercard do

  let(:station) {double(:station)}
  let(:station2) {double(:station2)}
  
  describe '#initialization' do
    it 'has a balance of zero' do
        expect(subject.balance).to eq(0)
    end 
    it 'has an empty list of journeys' do
      expect(subject.journeys).to eq []
    end
  end
  
  describe '#top_up' do 
    it { is_expected.to respond_to(:top_up).with(Oystercard::MINIMUM_BALANCE).argument }
     
    it 'can top up the balance' do 
      expect{ subject.top_up (Oystercard::MINIMUM_BALANCE) }.to change{ subject.balance }.by Oystercard::MINIMUM_BALANCE
    end
   
    it "raises an error if max balance is exceeded " do 
      expect{ subject.top_up(Oystercard::MAXIMUM_BALANCE + Oystercard::MINIMUM_BALANCE) }.to raise_error "balance exceeded"
    end 
  end 
   
  describe '#deduct' do 
  xit "deducts money" do 
    subject.top_up(10)
    expect{ subject.deduct }.to change{ subject.balance }.by(- Oystercard::MINIMUM_BALANCE)
  end 
  end 
  
  describe '#touch_in' do 
    it "touches in" do 
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq(true)
    end
    it "touches in" do 
      expect{subject.touch_in(station)}.to raise_error "insufficient funds"
    end 
    it "remembers the station" do 
      subject.top_up(5)
        subject.touch_in(station)
        expect(subject.entry_station).to eq(station)
    end 
  
  end

  describe '#touch_out' do 
    it "touches out" do 
      subject.top_up(5)
      subject.touch_in(station)
      subject.touch_out(station2)
      expect(subject.in_journey?).to eq(false)
    end
    it 'deducts balance' do
      subject.top_up(5)
      subject.touch_in(station)
      expect{ subject.touch_out(station2) }.to change{ subject.balance }.by(- Oystercard::MINIMUM_BALANCE)
    end
   it 'creates one journey' do
     subject.top_up(5)
     subject.touch_in(station)
     subject.touch_out(station2)
     p subject.journeys
     expect(subject.journeys[0]).to eq ({"#{station}" => "#{station2}"})
   end
  end



end 


