require_relative "station"

class Oystercard

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :entry_station, :exit_station, :journey_history, :journey_number

  def initialize
    @balance = DEFAULT_BALANCE
    @journey_history = {}
    @journey_number = 0
  end

  def top_up(amount)
    fail "The £#{MAX_BALANCE} maximum limit would be exceeded!" if limit_reached?(amount)
    @balance += amount
  end


  def touch_in(station)
    fail "Insufficient funds: you need at least £#{MIN_FARE} to travel" if insufficient_funds?
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @exit_station = station
    incriment_journey_number
    record_history
    reset_entry_station
  end


  def in_journey?
    !!entry_station
  end

private

  def limit_reached?(amount)
    (@balance + amount) >= 90
  end

  def insufficient_funds?
    @balance < MIN_FARE
  end

  def deduct(amount)
    @balance -= amount
  end

  def record_history
    @journey_history.merge!("Journey #{@journey_number}"=>[@entry_station, @exit_station])
  end

  def reset_entry_station
      @entry_station = nil
    end

  def incriment_journey_number
    @journey_number += 1
  end


end
