describe Diff do
  describe '::patch' do
    let(:nil_state)           { nil }
    let(:nil_state_changes)   { [0, 4, 0, 3, 4, 0] }

    let(:zero_state)          { [0, 0, 0, 0] }
    let(:zero_state_changes)  { [1, 2, 3, 4, 1] }

    let(:no_change_state)     { [0, 3, 4, 0] }
    let(:no_state_changes)    { [4] }

    let(:output_state)        { [0, 3, 4, 0] }

    it { assert_equal(output_state, Diff.patch(nil_state, nil_state_changes)) }
    it { assert_equal(output_state, Diff.patch(zero_state, zero_state_changes)) }
    it { assert_equal(output_state, Diff.patch(no_change_state, no_state_changes)) }
  end
end
