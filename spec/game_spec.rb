require 'game'

describe 'game' do
  it 'attacks a player' do
    player1_double = double("Player", :name => "Jane", :hp => 100, :attack => true)
    player2_double = double("Player", :name => "John", :hp => 100)

    g = Game.new(player1_double, player2_double)
    g.attack

    expect(player1_double).to have_received(:attack)
  end

  it 'defends a player' do
    player1_double = double("Player", :name => "Jane", :hp => 100, :get_attacked => true, :defend => true)
    player2_double = double("Player", :name => "John", :hp => 100, :get_attacked => true, :defend => true)

    g = Game.new(player1_double, player2_double)
    g.defend

    expect(player1_double).to have_received(:defend)
  end

  it 'stores player names' do
    player1_double = double("Player", :name => "Jane", :hp => 100)
    player2_double = double("Player", :name => "John", :hp => 100)

    g = Game.new(player1_double, player2_double)

    expect(g.players).to eq "Jane, John"
  end
  it 'checks when a game is lost' do
    player1_double = double("Player", :name => "Jane", :hp => 10)
    player2_double = double("Player", :name => "John", :hp => 0)

    g = Game.new(player1_double, player2_double)

    expect(g.winner?).to eq player1_double
  end
end