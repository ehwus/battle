feature "Testing infrastructure" do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Testing infrastructure working!'
  end

  scenario "Players can enter their names that are then displayed on screen" do
    sign_in_and_play
    expect(page).to have_content 'ALM'
    expect(page).to have_content 'AWS'
  end
end

feature "Hit points" do
  scenario "player 1 (starting player) can enter a battle and see their health" do
    sign_in_and_play
    expect(page).to have_content 'ALM: 69HP'
  end
end

feature "Attacking" do
  scenario "attack Player 2" do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content(/attacked/)
  end
end