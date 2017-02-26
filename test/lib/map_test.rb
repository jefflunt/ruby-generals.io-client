describe Map do
  let(:width)     { 2 }
  let(:height)    { 3 }
  let(:size)      { width * height }
  let(:armies)    { [1, 0, 0, 0, 0, 0] }
  let(:terrain)   { [1, -1, -1, -1, -1, -1] }
  let(:map_input) { [0, 14, 2, 3, armies, terrain].flatten }
  let(:map) { Map.new(map_input) }

  describe '#initialize' do
    it { assert_equal(width, map.width) }
    it { assert_equal(height, map.height) }
    it { assert_equal(size, map.size) }
    it { assert_equal(armies, map.armies) }
    it { assert_equal(terrain, map.terrain) }
  end

  describe '#update' do
    let(:map_diff)        { [2, 1, 2, 11] }
    let(:updated_map)     { map.update(map_diff) }
    let(:updated_armies)  { [2, 0, 0, 0, 0, 0] }
    let(:updated_terrain) { terrain }

    it { assert_equal(width, updated_map.width) }
    it { assert_equal(height, updated_map.height) }
    it { assert_equal(size, updated_map.size) }
    it { assert_equal(updated_armies, updated_map.armies) }
    it { assert_equal(updated_terrain, updated_map.terrain) }
  end

  describe '#to_hash' do
    it { assert_equal({}, map.to_hash) }
  end
end
