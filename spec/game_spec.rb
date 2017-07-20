require 'game'
describe Game do
  subject(:game) {described_class.new}
  let(:player) {Player.new('Gerrald')}
  describe '#attack' do
    it 'should reduce hit points' do
      expect{ game.attack(player) }.to change{player.hp}.by(-10)
    end
  end
end
