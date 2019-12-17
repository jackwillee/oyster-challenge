class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1 
  
  attr_reader :balance, :entry_station

  def initialize
  @balance = 0

end 

def top_up(amount)
  raise "balance exceeded" if @balance + amount > MAXIMUM_BALANCE
  @balance = @balance + amount
end 



def touch_in(station)
    raise "insufficient funds" if @balance  < MINIMUM_BALANCE
  @entry_station = station 
end 
def touch_out
  @entry_station = nil 
  deduct
end 

def in_journey?
  !!@entry_station
end

private
def deduct 
  @balance -= MINIMUM_BALANCE
end 

end 