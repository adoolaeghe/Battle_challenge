class Player
  attr_reader :name, :hp
  def initialize(name, hp=100, attacks = 2)
    @name = name
    @hp = hp
    @attacks = attacks
  end

  def lose
    hp <= 0
  end

  def attack_reduce(damage = rand(1..100))
    @hp -= damage
  end

  def big_attack(damage = rand(20..30))
    @hp -= damage
    @attacks -= 1
  end
end
