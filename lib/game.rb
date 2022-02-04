class Game
  attr_reader :player1, :player2, :current_player, :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @opponent = @player2
    @winner = nil
  end

  def attack
    @current_player.attack(@opponent)
    switch_player
    winner?
  end

  def put_to_sleep
    @opponent.go_to_sleep
    switch_player
  end

  # def defend(player)
  #   player.defend
  #   switch_player
  # end

  def defend
    @current_player.defend
    switch_player
  end

  def players
    "#{@player1.name}, #{@player2.name}"
  end

  def switch_player
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