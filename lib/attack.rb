class Attack
  attr_reader :from, :to, :is_50

  def initialize(from:, to:, is_50:)
    @from, @to, @is_50 = from, to, is_50
  end

  def to_args
    [from, to, is_50]
  end
end
