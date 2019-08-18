require 'journey'
describe Journey do

# it 'can check whether it is in use' do
#   oyster = Oystercard.new
#   oyster.top_up(2)
#   journey = Journey.new
#   journey.touch_in(station)
#   expect(subject.in_journey?).to be(true)
# end

it 'can raise error if money is not enuf when touched in' do
  expect { journey.touch_in (station) }.to raise_error("Not enuf money!")
end

end
