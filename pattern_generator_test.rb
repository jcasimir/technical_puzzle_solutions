require 'minitest/autorun'
require './pattern_generator'
require 'minitest/pride'

class PatternGeneratorTest < Minitest::Test

  def test_a_single_letter_pattern
    skip
    pg = PatternGenerator.new('X')
    assert_equal 26, pg.available
    assert_equal ('A'..'Z').to_a, pg.all
  end

  def test_a_single_number_pattern
    skip
    pg = PatternGenerator.new('N')
    assert_equal 10, pg.available
    assert_equal (0..9).to_a, pg.all
  end

  def test_a_two_number_pattern
    skip
    pg = PatternGenerator.new('NN')
    expected_first = %w(00 01 02 03 04 05 06 07 08 09)
    expected_rest  = (10..99).to_a.map(&:to_s)
    expected = expected_first + expected_rest
    assert_equal expected, pg.all
    assert_equal 100, pg.available
  end

  def test_a_five_number_pattern
    pg = PatternGenerator.new('NNNNN')
    expected = (0..99999).to_a.map{|i| i.to_s.rjust(5, '0')}
    assert_equal expected, pg.all
    assert_equal 100000, pg.available
  end
end