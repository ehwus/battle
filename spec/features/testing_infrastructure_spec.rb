feature "Testing infrastructure" do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'THE BLACK LODGE'
  end

  scenario "Players can enter their names that are then displayed on screen" do
    sign_in_and_play
    expect(page).to have_content 'ALM'
    expect(page).to have_content 'AWS'
  end

  scenario "Can advance to next screen after attack confirmation" do
    sign_in_and_play
    click_button 'Attack'
    click_button 'Next'
  end
end

feature "Hit points" do
  scenario "player 1 (starting player) can enter a battle and see their health" do
    sign_in_and_play
    expect(page).to have_content 'ALM: 69HP'
  end

  scenario "both players HP is shown on the play screen" do
    sign_in_and_play
    expect(page).to have_content 'ALM: 69HP'
    expect(page).to have_content 'AWS: 69HP'
  end
end

feature "Attacking" do
  scenario "attack Player 2 and confirm that health has been reduced" do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content(/ALM attacked AWS/)
  end

  scenario "displays player 2 as attacker on second round" do
    sign_in_and_play
    click_button 'Attack'
    click_button 'Next'
    click_button 'Attack'
    expect(page).to have_content(/AWS attacked ALM/)

  end
end

feature "Turns" do
  scenario "player 1 is the first to have turn" do
    sign_in_and_play
    expect($game.current_turn.name).to eq("ALM")
  end

  scenario "player 2 is the second to have turn" do
    sign_in_and_play
    click_button 'Attack'
    expect($game.current_turn.name).to eq("AWS")
  end

  scenario "displays that it's player ones turn" do
    sign_in_and_play
    expect(page).to have_content(/It's ALM's turn/)
  end
end

feature "End Conditions" do
  scenario "game ends and declares a winner" do
    sign_in_and_play
    13.times do
      click_button 'Attack'
      click_button 'Next'
    end
    expect(page).to have_content(/ALM has beaten AWS/)
  end
end