feature ''
it 'should switch current victim' do
  game.attack
  expect(game.current_victim).to eq player_1
end
