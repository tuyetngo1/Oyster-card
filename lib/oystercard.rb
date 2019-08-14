class Oystercard
  attr_reader :oystercard, :balance, :entry_station
  # def oystercard
  #   @oystercard
  # end
  MAX_CONSTANT = 90
  MIN_CONSTANT = 1
  def initialize
    # @oystercard = 0
    @balance = 0
    # @state = false
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
    @balance + money > MAX_CONSTANT
  end



  def in_journey?
    # @state
    # if @card == true
    #   return true
    # elsif @card ==false
    #   return false
    # end
    @entry_station != nil 
  end

  def touch_in(station)
    # @card = true
    fail "Not enuf money!" if @balance < MIN_CONSTANT
    # @state = true
    @entry_station = station
  end

  def touch_out(station)
    # @card = false
    deduct(2)
    # @state = false
    @entry_station = nil
  end

  # def not_enough?
  #   @balance < 1
  # end
  private
  def deduct(money)
    @balance -= money
  end

end
