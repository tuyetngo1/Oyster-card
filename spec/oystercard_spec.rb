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

  it 'response to deduct method' do
    expect(subject).to respond_to(:deduct).with(1).argument
  end

  it 'can deduct the money' do
    subject.deduct(10)
    expect(subject.balance).to eq(-10)
  end

  it 'can check whether it is in use' do
    subject.touch_in
    expect(subject.in_journey?).to be(true)
  end
  it 'can touch out' do
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey?).to be(false)
  end
end
