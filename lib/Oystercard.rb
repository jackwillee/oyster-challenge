class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1 
  attr_reader :balance, :in_journey
def initialize
  @balance = 0

end 

def top_up(amount)
  raise "balance exceeded" if @balance + amount > MAXIMUM_BALANCE
  @balance = @balance + amount
end 

def deduct
  @balance -= 1 
end 

def touch_in 
    raise "insufficient funds" if @balance  < MINIMUM_BALANCE
  @in_journey = true
end 
def touch_out
  @in_journey = false 
end 

def in_journey?
  @in_journey
end

end 