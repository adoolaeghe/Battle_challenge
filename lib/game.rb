class Game

attr_reader :player_1, :player_2
attr_accessor :current_victim

  def initialize(player_1, player_2)
    @player_1 = player_1
    @current_victim = player_2
    @player_2 = player_2
  end

  def attack
    @current_victim.attack_reduce
    switch_players
  end

  def big_attack
    @current_victim.big_attack
    switch_players
  end

  def finish_player_1
    @player_1.lose
  end

  def finish_player_2
    @player_2.lose
  end


private

  def switch_players
    @current_victim == player_1 ? @current_victim = player_2 : @current_victim = player_1
  end
end
