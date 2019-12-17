class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1 
  
  attr_reader :balance, :entry_station, :journeys

  def initialize
    @balance = 0
    @journeys = []

  end 

def top_up(amount)
  raise "balance exceeded" if @balance + amount > MAXIMUM_BALANCE
  @balance = @balance + amount
end 

def touch_in(entry_station)
  raise "insufficient funds" if @balance  < MINIMUM_BALANCE
  @entry_station = entry_station 
  @journey = Hash.new
  @journey["#{@entry_station}"] = nil
end 

def touch_out(exit_station)
  
  deduct
  @journey["#{@entry_station}"] = "#{exit_station}"
  @journeys << @journey
  @entry_station = nil 
end 

def in_journey?
  !!@entry_station
end

private
def deduct 
  @balance -= MINIMUM_BALANCE
end 

end 