feature 'confirm that the player 1 lost' do
  before :each do
    srand(10)
  end
  scenario 'player 1 lost' do
    sign_in_and_play
    9.times do
      find("form[name='attack_2']").click_button('Attack Player 2')
      find("form[name='attack_1']").click_button('Attack Player 1')
    end
    find("form[name='attack_2']").click_button('Attack Player 2')
    expect(page).to have_content('The rabbit won!')
  end
end
