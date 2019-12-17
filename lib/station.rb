class Station 
  
  attr_reader :name, :zone
  
  def initialize(name, zone)
    @name = name
    @zone = zone
  end

  # def touch_in(card)
  #   card.touch_in
  #   @cards << card
  # end
end
