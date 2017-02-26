class Map
  attr_reader :width, :height, :size, :armies, :terrain

  # Creates a new map from a starting diff
  def initialize(map_data)
    @width = map_data[2]
    @height = map_data[3]
    @size = @width * @height
    @map = map_data[2..-1]
    @armies = @map[2..(@size + 1)]
    @terrain = @map[(@size + 2)..-1]
  end

  # Returns a new Map with the specified diff applied
  def update(diff)
    Map.new([@width, @height, Diff.patch(@map, diff)].flatten)
  end
end
