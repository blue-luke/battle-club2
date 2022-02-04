# Battle - a web project with testing frameworks

## Approach

There is the question of how to develop functionality: horizontally, doing the logic first then the web interface second; or vertically, implementing one piece of functionality logically and in the interface before proceeding to the next piece of functionality.

I think it is better to do it horizontally, as this will reduce the scope for errors and reduce the need for refactoring... hopefully. Though, I will only do the basic user stories before doing the interface, returning to advanced user stories later.

However, I am following the tutorial at the moment, so this question is moot.

I should use a vertical approach an another web project to allow me to compare the two approaches.

## Highlights

- The test 'Successfully defend player 2', lines 19 to 31 in attack_a_player_spec.rb. Line 26 features an 'unstubbing' of a method call. This is necessary because the method has to be stubbed initially (line 20) to ensure a specific amount of damage is incurred by player 2 (line 24). However, stubbing the method also avoids the 'defend' functionality, which we want to then test for. So, unstubbing is necessary.

## Basic user stories

As two Players,
So we can play a personalised game of Battle,
We want to Start a fight by entering our Names and seeing them

As Player 1,
So I can see how close I am to winning
I want to see Player 2's Hit Points

As Player 1,
So I can win a game of Battle,
I want to attack Player 2, and I want to get a confirmation

As Player 1,
So I can start to win a game of Battle,
I want my attack to reduce Player 2's HP by 10

As two Players,
So we can continue our game of Battle,
We want to switch turns

As Player 1,
So I can see how close I am to losing,
I want to see my own hit points

As Player 1,
So I can lose a game of Battle,
I want Player 2 to attack me, and I want to get a confirmation

As Player 1,
So I can start to lose a game of Battle,
I want Player 2's attack to reduce my HP by 10

As a Player,
So I can Lose a game of Battle,
I want to see a 'Lose' message if I reach 0HP first

## Advanced user stories

As a Player,
So I can play a suspenseful game of Battle,
I want all Attacks to deal a random amount of damage

As a Player,
So I can play a defensively if I am close to losing
I want to be able to defend myself for one turn

As a Player,
So I can better enjoy a game of Battle,
I want to make an attack that has a chance of sending my Opponent to Sleep (Opponent definitely misses next turn)

As a Player,
So I can enjoy a game of Battle with more variety,
I want to choose from a range of attacks I could make

--- Above this line means completed ---


As a lonely Player,
So I can keep my Battle skills up to scratch
I want to play a Computerised opponent

As a Player,
So I can enjoy my game of Battle,
I want a sexy user interface

As a Player,
So that I can play a game from any computer
I want the app hosted externally

## Custom user stories

As a Player,
So that I can play a game on the move
I want to be able to play a game by text message

## Not implementing these user stories

As a Player,
So I can better enjoy a game of Battle,
I want one of my attacks to have a chance of Poisoning my Opponent (Opponent takes a small random amount of damage at the beginning of their turn)

As a Player,
So I can extend my joyous experience of Battle,
I want to have an attack that heals some of my Hit Points


As a Player,
So I can better enjoy a game of Battle,
I want some of my attacks to Paralyse an opponent (chance of losing their next attack)
