require 'oystercard'
describe Oystercard do

  it 'has a balance of zero' do
      expect(subject.balance).to eq(0)
  end 
  describe '#top_up' do 
    it { is_expected.to respond_to(:top_up).with(1).argument }
     
    it 'can top up the balance' do 
      expect{ subject.top_up (1) }.to change{ subject.balance }.by 1
    end
   
    it "raises an error if max balance is exceeded " do 
      expect{ subject.top_up(Oystercard::MAXIMUM_BALANCE + 1) }.to raise_error "balance exceeded"
    end 
  end 
 
describe '#deduct' do 
  it "deducts money" do 
    subject.top_up(10)
    expect{ subject.deduct }.to change{ subject.balance }.by(-1)
  end 
end 
describe '#touch_in' do 
  it "touches in" do 
    subject.touch_in
    expect(subject.in_journey).to eq(true)
  end
end
describe '#touch_out' do 
  it "touches out" do 
    subject.touch_out
    expect(subject.in_journey).to eq(false)
end
end








end 


