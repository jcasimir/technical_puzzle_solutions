class PatternGenerator
  attr_reader :pattern

  def initialize(input_pattern)
    @pattern = input_pattern
  end

  def available
    all.count
  end

  def all
    compute_all(pattern)
  end

  def compute_all(fragment)
    if fragment.length == 1
      codes_for(fragment)
    else
      first = fragment[0]
      rest = fragment[1..-1]
      codes_for(first).product(compute_all(rest)).map{|g| g.inject(:+)}
    end
  end

  def codes_for(character)
    if character == "X"
      ('A'..'Z').to_a
    else
      (0..9).to_a.map(&:to_s)
    end
  end
end