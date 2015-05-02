class PatternGenerator
  attr_reader :pattern

  def initialize(input_pattern)
    @pattern = input_pattern
  end

  def available
    all.count
  end

  def all
    sets = pattern.chars.map{|c| codes_for(c)}
    output = []

    sets[0].each do |a|
      sets[1].each do |b|
        sets[2].each do |c|
          sets[3].each do |d|
            sets[4].each do |e|
              output << (a + b + c + d + e)
            end
          end
        end
      end
    end

    return output
  end

  def codes_for(character)
    if character == "X"
      ('A'..'Z').to_a
    else
      (0..9).to_a.map(&:to_s)
    end
  end
end