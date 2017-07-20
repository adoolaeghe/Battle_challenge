class Player
  attr_reader :name, :hp
  def initialize(name, hp=100)
    @name = name
    @hp = hp
  end

  def attack_reduce
    @hp -= 10
  end
end
