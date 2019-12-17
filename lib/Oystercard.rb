class Oystercard
    MAXIMUM_BALANCE = 90
attr_reader :balance
def initialize
    @balance = 0

end 

def top_up(amount)
    raise "balance exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance = @balance + amount
    
end 
end 