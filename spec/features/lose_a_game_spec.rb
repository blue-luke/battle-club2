require 'spec_helper.rb'

feature 'State next turn' do
  scenario 'A winner is announced' do
    allow_any_instance_of(Player).to receive(:calculate_damage).and_return(10)

    sign_in_and_play

    9.times do
      click_button('Attack!')
      click_button('Attack!')
    end
    click_button('Attack!')

    expect(page).to have_content "Well done, Jane, you have won!"
  end
  scenario 'Redirected to index to start a new game' do
    allow_any_instance_of(Player).to receive(:calculate_damage).and_return(10)
    
    sign_in_and_play

    9.times do
      click_button('Attack!')
      click_button('Attack!')
    end
    click_button('Attack!')
    click_button('New game')

    expect(page).to have_content "Would you like to play a game?"
  end
end