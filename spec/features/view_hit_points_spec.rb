feature "can see the other player's hitpoints" do

  scenario "game start" do
    sign_in_and_play
    expect(page).to have_content "Antoine's HP: 100", "Alison's HP: 100"
  end
end
