oyster.balance #0
oyster.top_up(money) #balance == money
oyster.deduct(money) #balance -= money
oyster.in_journey? # already touch_in but not touch_out => "Yes,in use"
oyster.touch_in #
oyster.touch_out #
oyster.touch_in + oyster.balance => if balance <1 => raise error
oyster.balance after touch_out < balance when touch_in
oyster.touch_in # remember which station we touched in. 
