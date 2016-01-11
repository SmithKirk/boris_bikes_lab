require_relative 'bike'

class DockingStation

  attr_reader :bikes

  CAPACITY = 20

  def initialize
    @bikes = []

  end


  def release_bike(bike)
    fail "No bikes available" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Docking station full" if full?
    @bikes << bike
  end

  private

  def full?
    bikes.count >= CAPACITY
  end

  def empty?
    bikes.empty?
  end


end
