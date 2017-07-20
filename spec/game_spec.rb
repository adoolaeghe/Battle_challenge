require 'game'
describe Game do
  let(:player_1) { double :player }
  let(:player_2) { double :player }
  subject(:game) {described_class.new(player_1, player_2)}
  let(:player) {Player.new('Gerrald')}


  describe '#initialize' do
    it 'should have two players' do
      expect(game.player_1).to eq player_1
    end
  end

  describe '#attack' do

    it 'should reduce hit points' do
      expect{ game.attack(player) }.to change{player.hp}.by(-10)
    end

    it 'damages the player' do
      expect(player_2).to receive(:attack_reduce)
      game.attack(player_2)
    end
  end
end
