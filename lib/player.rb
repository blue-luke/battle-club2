class Player
  attr_reader :name, :hp, :defending, :asleep
  def initialize(name)
    @name = name
    @hp = 100
    @defending = false
    @asleep = false
  end
  def get_attacked
    @hp -= calculate_damage
  end
  def calculate_damage
    @asleep = false
    unless @defending
      rand(10)
    else
      @defending = false
      0
    end
  end
  def attack(player)
    unless @asleep
      player.get_attacked
    end
    @asleep = false
  end
  def defend
    @defending = true
  end
  def calculate_sleep_odds
    rand(10)
  end
  def go_to_sleep
    if calculate_sleep_odds > 5
      @asleep = true
    else
      @asleep = false
    end
  end
end