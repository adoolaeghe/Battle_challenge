feature 'confirm that player 1 has attacked  player 2' do
  scenario 'game in progress' do
    sign_in_and_play
    find("form[name='attack_2']").click_button('Attack Player 2')
    expect(page).to have_content "Antoine turn"
  end
end
