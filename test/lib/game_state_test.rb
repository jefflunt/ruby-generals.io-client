describe GameState do
  let(:data) { { 'camelKey' => 'camelValue' } }
  let(:game_state) { GameState.new({ 'data_key' => 'data value' }) }
  let(:camel_state) { GameState.new(data) }

  describe '#initialize' do
    it('converts camelCase keys to snake_case') { assert_equal('camelValue', camel_state.camel_key) }
  end

  describe '#method_missing' do
    it('returns values under snake_case keys')  { assert_equal('camelValue', camel_state.camel_key) }
    it('returns nil for non-existing data')     { assert_nil(game_state.non_existing_data) }
  end

  describe '#update' do
    let(:new_game_state) { game_state.update({ 'new_data' => 'the new data' }) }

    it { assert_equal('data value', new_game_state.data_key) }
    it { assert_equal('the new data', new_game_state.new_data) }
  end
end
