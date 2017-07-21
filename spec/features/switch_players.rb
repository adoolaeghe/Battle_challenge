feature 'switching players' do
  scenario 'after attack' do
    sign_in_and_play
    click_button('Attack')
    click_button('Ok')
    expect(page).to have_content "Alison's turn !!!!"
  end
end
