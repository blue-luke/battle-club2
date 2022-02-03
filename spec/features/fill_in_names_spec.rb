feature 'Can fill names' do
  scenario 'Can fill in then see names' do
    sign_in_and_play

    expect(page).to have_content 'Hello there, Jane and John, are you ready to play?'
  end
end