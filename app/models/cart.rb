class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def creatures
    contents.keys.map do |key|
      Creature.find(key.to_i)
    end
  end

  def add_creature(creature_id)
    contents[creature_id.to_s] ||= 0
    contents[creature_id.to_s] += 1
  end

  def total_count
    contents.values.sum
  end

  def total_price
    creatures.reduce(0) do |sum, creature|
      sum + creature.price
    end
  end

  def count_of(creature_id)
    contents[creature_id.to_s]
  end
end
