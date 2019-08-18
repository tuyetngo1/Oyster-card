class Oystercard
  attr_reader :oystercard, :balance, :entry_station, :history, :completed_journey, :exit_station, :MAX, :MIN
  # def oystercard
  #   @oystercard
  # end
  MAX = 90
  MIN = 1
  def initialize
    # @oystercard = 0
    @balance = 0
    # @state = false
    @history = []

  end

  # def balance
  #   @oystercard
  # end
  def top_up(money)
      if too_much?(money)
      raise "Too much money! Exceed limit!"
    else
      @balance += money
    end
  end

  def too_much?(money)
    @balance + money > MAX
  end

  # def fare
  #   # return MIN_CONSTANT
  #   if @entry_station == nil || @exit_station == nil
  #   return @balance = @balance - 6
  #   else
  #   return @balance
  #   end
  # end

  # def in_journey?
  #   # @state
  #   # if @card == true
  #   #   return true
  #   # elsif @card ==false
  #   #   return false
  #   # end
  #   @entry_station != nil || @exit_station != nil
  # end
  #
  # def touch_in(station)
  #   # @card = true
  #   fail "Not enuf money!" if @balance < MIN_CONSTANT
  #   # @state = true
  #   @entry_station = station
  # end
  #
  # def touch_out(station)
  #   # @card = false
  #   deduct(2)
  #   # @state = false
  #   @exit_station = station
  #   @completed_journey = {start: @entry_station, end: @exit_station}
  #   @entry_station = nil
  #   @history << @completed_journey
  #
  # end
  #
  # # def not_enough?
  # #   @balance < 1
  # # end
  
  def deduct(money)
    @balance -= money
  end

end
