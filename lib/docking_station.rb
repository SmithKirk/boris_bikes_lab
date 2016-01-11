require_relative 'bike'

class DockingStation

  attr_reader :bikes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end


  def release_bike(bike)
    fail "No bikes available" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Docking station full" if full?
    @bikes << bike
  end

  def set_capacity(new_capacity)
    @capacity = new_capacity
  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end


end
