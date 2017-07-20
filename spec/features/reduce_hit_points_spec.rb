feature "Reduce player's hit points when attacked" do
  scenario 'Game in progress' do
    sign_in_and_play
    click_button('Attack')
    click_button('Ok')
    expect(page).to have_content "Alison's HP: 90"
  end
end
