require 'oystercard'

describe "user stories" do

  # In order to use public transport
  # As a customer
  # I want money on my card
  it "So that I can use public transport, I need money on card" do
    oyster = Oystercard.new
    expect {oyster.balance}.not_to raise_error
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card
  it "So that I can keep using public transport, I need to be able to top up" do
    oyster = Oystercard.new
    expect {oyster.top_up(10)}.not_to raise_error
  end

  # In order to protect my money from theft or loss
  # As a customer
  # I want a maximum limit (of £90) on my card
  it "So that I don't risk too much money, I want a max limit of £#{Oystercard::MAX_BALANCE}" do
    oyster = Oystercard.new
    expect {oyster.top_up(Oystercard::MAX_BALANCE+10)}.to raise_error "The £#{Oystercard::MAX_BALANCE} maximum limit would be exceeded!"
  end

  # In order to pay for my journey
  # As a customer
  # I need my fare deducted from my card
  it "So that I can travel, I need the correct amount to be deducted for each journey. " do
    oyster = Oystercard.new
    oyster.top_up(80)
    expect{oyster.deduct(10)}.to change{oyster.balance}.by -10
  end


end
