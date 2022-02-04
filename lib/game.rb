class Game
  attr_reader :player1, :player2, :current_player, :winner, :opponent

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @opponent = @player2
    @winner = nil
  end

  def attack
    unless @current_player.asleep
      @opponent.get_attacked
    end
    switch_player
    winner?
  end

  def put_to_sleep
    unless @current_player.asleep
      @opponent.go_to_sleep
    end
    switch_player
  end

  def defend
    unless @current_player.asleep
      @current_player.defend
    end
    switch_player
  end

  def players
    "#{@player1.name}, #{@player2.name}"
  end

  def switch_player
    @current_player.wake_up
    if @current_player == @player1
      @current_player = @player2
      @opponent = @player1
    elsif @current_player == @player2
      @current_player = @player1
      @opponent = @player2
    end
  end
  
  def winner?
    if @player1.hp <= 0
      @winner = @player2
    elsif @player2.hp <= 0
      @winner = @player1
    end
  end
end