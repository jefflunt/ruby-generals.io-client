module Diff
  def self.patch(state, diff)
    state_index = 0
    state = Array.new(diff[2] * diff[3]) if state.nil?

    loop do
      state_index += diff.shift
      break if diff.empty?

      mismatched = diff.shift
      mismatched.times do |i|
        state[state_index] = diff.shift
        state_index += 1
      end
      break if diff.empty?
    end

    state
  end
end
