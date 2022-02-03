def sign_in_and_play
  visit('/')

  fill_in('Player 1', with: 'Jane')
  fill_in('Player 2', with: 'John')
  click_button('Start game!')
end
