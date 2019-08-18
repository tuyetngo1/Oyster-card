
class Journey
  attr_reader :card_balance, :entry_station, :exit_station
MIN = 1
PENALTY = 6
  def initialize(oystercard)
    @entry_station = nil
    @exit_station = nil
    @card_balance = oystercard.balance
    @history = oystercard.history
  end

  # def in_journey?
  #   # @state
  #   # if @card == true
  #   #   return true
  #   # elsif @card ==false
  #   #   return false
  #   # end
  #   @entry_station != nil
  # end

  def touch_in(station)
    # @card = true
    fail "Not enuf money!" if @card_balance < MIN
    # @state = true
    @entry_station = station
  end

  def touch_out(oystercard,station)
    # @card = false
    # @state = false
    # if touch_in?
    @exit_station = station
    if @entry_station == nil
      @card_balance = oystercard.deduct(PENALTY)
    else
    @card_balance = oystercard.deduct(3)
    end
    @completed_journey = {start: @entry_station, end: @exit_station}
    # @entry_station = nil
    @history << @completed_journey
    # else
    # deduct(PENALTY)
    # @history << @completed_journey
    # @card_balance
    # end
  end
  def touch_in?
    # @state
    # if @card == true
    #   return true
    # elsif @card ==false
    #   return false
    # end
    @entry_station != nil
  end

  def touch_out?
    @exit_station != nil
  end

  def fare(oystercard)
    # return MIN_CONSTANT
      if @exit_station == nil && touch_in?
        return @card_balance = oystercard.deduct(6)
      elsif touch_in? && touch_out?
          return @card_balance
      end
      return @card_balance  
  end



  # def complete
  #   @entry_station = nil
  #   @exit_station = nil
  # end
  # def fare
  #   # return MIN_CONSTANT
  #   if @entry_station == nil || @exit_station == nil
  #   return @balance = @balance - 6
  #   else
  #   return @balance
  #   end
  # end

  # def not_enough?
  #   @balance < 1
  # end
  private
  def deduct(money)
    @card_balance -= money
  end
end
