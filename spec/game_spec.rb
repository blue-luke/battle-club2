require 'game'

describe 'game' do
  it 'attacks a player' do
    player1_double = double("Player", :name => "Jane", :hp => 100, :asleep => false, :wake_up => true)
    player2_double = double("Player", :name => "John", :hp => 100, :get_attacked => true)

    g = Game.new(player1_double, player2_double)
    g.attack

    expect(player2_double).to have_received(:get_attacked)
  end

  it 'defends a player' do
    player1_double = double("Player", :defend => true, :wake_up => true, :asleep => false)
    player2_double = double("Player")

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
  it 'players cannot attack when asleep' do
    player1_double = double("Player", :asleep => true, :wake_up => true, :hp => 100)
    player2_double = double("Player", :hp => 100)

    g = Game.new(player1_double, player2_double)

    expect(player2_double).to_not receive(:get_attacked)

    g.attack
  end
  it 'prints player status' do
    player1_double = double("Player", :asleep => true, :wake_up => true, :hp => 100)
    player2_double = double("Player", :hp => 100)

    g = Game.new(player1_double, player2_double)


  end
end