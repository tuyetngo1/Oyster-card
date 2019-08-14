require 'oystercard'

describe Oystercard do
  it 'can return the balance of 0' do
  oyster = Oystercard.new
  expect(oyster.balance).to eq(0)
  end


  it 'can top_up money to oyster card' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end


  it 'can return new balance' do
    subject.top_up(10)
    expect(subject.balance).to eq(10)
  end

  it 'raise an exception when balance exceed the limit' do

  oyster = Oystercard.new
  oyster.top_up(80)
  expect { oyster.top_up(11) }.to raise_error("Too much money! Exceed limit!")
  end

  # it 'response to deduct method' do
  #   expect(subject).to respond_to(:deduct).with(1).argument
  # end

  # it 'can deduct the money' do
  #   subject.deduct(10)
  #   expect(subject.balance).to eq(-10)
  # end

  it 'can check whether it is in use' do
    subject.top_up(2)
    subject.touch_in(station)
    expect(subject.in_journey?).to be(true)
  end
  it 'can touch out' do
    subject.top_up(2)
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.in_journey?).to be(false)
  end

  it 'can raise error if money is not enuf when touched in' do
    expect { subject.touch_in (station) }.to raise_error("Not enuf money!")
  end

  it 'change the balance when touch out' do
    subject.top_up(10)
    balance1 = subject.balance
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.balance).to be < 10
  end

  #it 'can change balance at check out' do
  # subject.top_up(20)
  # subject.touch_in
  # expect{ subject.touch_out }.to change { subject.balance }.by(-Oystercard::MINIMUM_BALANCE)
  # end
  let(:station){ double :station } #=> because you cannot access station from outside
  it 'can store the name of the station when touch in' do
  subject.top_up(2)
  subject.touch_in(station)
  expect(subject.entry_station).to eq station
  end

  it 'check the card has empty list by default' do
    expect(subject.history).to eq([])
  end

  it 'return completed_journey after touching in & out' do
    subject.top_up(10)
    subject.touch_in("Barbican")
    subject.touch_out("Eltham")
    expect(subject.completed_journey).to eq({start: "Barbican", end: "Eltham"})
  end
end
