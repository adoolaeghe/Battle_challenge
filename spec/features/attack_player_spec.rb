feature 'confirm that player 1 has attacked  player 2' do
  scenario 'game in progress' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content "Antoine has attacked Alison"
  end
end
