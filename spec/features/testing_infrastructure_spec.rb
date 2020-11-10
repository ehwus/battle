feature "Testing infrastructure" do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Testing infrastructure working!'
  end

  scenario "Players can enter their names that are then displayed on screen" do
    visit('/')
    fill_in('player1', with: "ALM")
    fill_in('player2', with: "AWS")
    click_button('Submit')
    expect(page).to have_content 'ALM'
    expect(page).to have_content 'AWS'
  end
end