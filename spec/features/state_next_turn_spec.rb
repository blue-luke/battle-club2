require 'spec_helper.rb'

feature 'State next turn' do
  scenario 'Player 1 goes first' do
    sign_in_and_play

    expect(page).to have_content "It is Jane's turn"
  end
  scenario 'Player 2 goes second' do
    sign_in_and_play
    click_button('Attack!')

    expect(page).to have_content "It is John's turn"
  end
end