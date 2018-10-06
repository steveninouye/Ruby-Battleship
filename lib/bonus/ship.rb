class Ship
  attr_reader :name, :size
  
  SHIPS = {
    "Carrier" => 5,
    "Battleship" => 4,
    "Cruiser" => 3,
    "Submarine" => 3,
    "Destroyer" => 2
  }

  def initialize(name)
    @name = name
    @size = SHIPS[name]
  end

  def hit
    @size -= 1
  end

  def destroyed?
    @size == 0
  end
end
