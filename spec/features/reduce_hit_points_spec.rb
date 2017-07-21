feature "Reduce player's hit points when attacked" do
  before :each do
    srand(10)
  end
  scenario 'Game in progress' do
    sign_in_and_play
    find("form[name='attack_2']").click_button('Attack Player 2')
    expect(page).to have_content "Alison's HP: 90"
  end
end
