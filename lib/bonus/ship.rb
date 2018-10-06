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
    @hp = SHIPS[name]
  end

  def hit
    @hp -= 1
  end

  def destroyed?
    @hp == 0
  end
end
