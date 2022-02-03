feature 'See hit points' do
  scenario 'Can fill in names then see hit points' do
    sign_in_and_play

    expect(page).to have_content 'John has 100 HP'
  end
end