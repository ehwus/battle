def sign_in_and_play
  visit('/')
  click_button('Play')
  fill_in('player1', with: "ALM")
  fill_in('player2', with: "AWS")
  click_button('Submit') 
end