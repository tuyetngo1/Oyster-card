class Oystercard
  attr_reader :oystercard, :balance
  # def oystercard
  #   @oystercard
  # end
  MAX_CONSTANT = 90
  def initialize
    # @oystercard = 0
    @balance = 0
    @state = false
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

  def deduct(money)
    @balance -= money
  end

  def in_journey?
    @state
    # if @card == true
    #   return true
    # elsif @card ==false
    #   return false
    # end
  end

  def touch_in
    # @card = true
    @state = true
  end

  def touch_out
    # @card = false
    @state = false
  end

end
