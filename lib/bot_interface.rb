module BotInterface
  def self.start(game_state)
    # This method's return value is ignored
  end

  def self.update(game_state)
    # This method return value should be either:
    # - nil
    # - an instance of the Attack class (see lib/attack.rb)
  end

  def self.game_over(game_state)
    # This method's return value is ignored
  end
end
