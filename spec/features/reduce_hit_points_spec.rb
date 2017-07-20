feature "Reduce player's hit points when attacked" do
  scenario 'Game in progress' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content "Alison's HP: 90"
  end
end
