require './lib/player'

describe 'player' do
  it 'stores a player, their name' do
    p1 = Player.new("Jane")
    expect(p1.name).to eq "Jane"
  end
  it 'starts a player with 100 hp' do
    p1 = Player.new("Jane")
    expect(p1.hp).to eq 100
  end
  it 'deducts some hp whenever attacked' do
    p1 = Player.new("Jane")
    p2 = Player.new("John")
    allow(p1).to receive(:calculate_damage).and_return(10)
    p2.attack(p1)
    expect(p1.hp).to eq 90
  end
  it 'attacks a player and deducts points' do
    p1 = Player.new("Jane")
    p2 = Player.new("John")
    allow(p2).to receive(:calculate_damage).and_return(10)
    p1.attack(p2)
    expect(p2.hp).to eq 90
  end
  it 'a player defends and loses no points next round' do
    p1 = Player.new("Jane")
    p2 = Player.new("John")
    p1.defend
    p2.attack(p1)
    expect(p1.hp).to eq 100
  end
  it 'a player defends for one round only' do
    p1 = Player.new("Jane")
    p2 = Player.new("John")
    p1.defend
    p2.attack(p1)
    expect(p1.defending).to eq false
  end  
  it 'sleeps and is defenceless' do
    p1 = Player.new("Jane")
    p2 = Player.new("John")
    allow(p1).to receive(:calculate_damage).and_return(10)
    p1.go_to_sleep
    p2.attack(p1)
    expect(p1.hp).to eq 90
  end
  it 'has odds of falling asleep' do
    p1 = Player.new("Jane")
    p2 = Player.new("John")
    allow(p1).to receive(:calculate_sleep_odds).and_return(1)
    p1.go_to_sleep
    expect(p1.asleep).to eq false
  end
  it 'sleeps for one round only' do
    p1 = Player.new("Jane")
    p2 = Player.new("John")
    allow(p1).to receive(:calculate_sleep_odds).and_return(10)
    p1.go_to_sleep
    p2.attack(p1)
    expect(p1.asleep).to eq false
  end
  it 'cannot attack while alseep but then they wake up and can attack again' do
    p1 = Player.new("Jane")
    p2 = Player.new("John")

    allow(p2).to receive(:calculate_sleep_odds).and_return(10)
    p2.go_to_sleep

    allow(p1).to receive(:calculate_damage).and_return(10)
    p2.attack(p1)

    expect(p1.hp).to eq 100

    p2.attack(p1)
    expect(p1.hp).to eq 90
  end
end