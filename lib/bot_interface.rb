##
# This module is your interface to writing a custom bot, and except in the case
# of a bug in the main library, it should be the only code you need to modify to
# create a bot.
#
# The `game_state` variable in each method call will be a non-nil instance of
# GameState (see lib/game_state.rb) containing the current state of the game.
module BotInterface
  ##
  # Called in response to http://dev.generals.io/api#game_start
  def self.start(game_state)
    # This method's return value is ignored
  end

  ##
  # Called in response to http://dev.generals.io/api#game_update
  #
  # game_state - a fully patched GameState instance. See lib/game_state.rb
  def self.update(game_state)
    # This method return value should be either:
    # - nil
    # - an instance of the Attack class (see lib/attack.rb)
  end

  ##
  # Called in response to either to:
  # - http://dev.generals.io/api#game_lost
  # - http://dev.generals.io/api#game_won
  def self.game_over(game_state)
    # This method's return value is ignored
  end
end
