require 'map'

##
# The current state of a game on a given turn.
class GameState
  # NOTE: Converts all incoming data keys to snake_case symbols so they can be
  # accessed via dotted notation
  def initialize(data)
    @state = data
    @state.keys.each do |k|
      symbolized_key = k.to_s
        .gsub(/[A-Z]/) { |match| "_#{match.downcase}" }
        .to_sym

      @state[symbolized_key] = @state.delete(k)
    end
  end

  def method_missing(attr)
    @state[attr]
  end

  def update(data)
    GameState.new(@state.merge(data))
  end
end
