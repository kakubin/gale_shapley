require 'test/unit'
require './lib/gale_shapley.rb'

class TestGaleShapley < Test::Unit::TestCase
  def test_basic
    girls_ranks = {
      '1': ['a', 'b', 'c', 'd'],
      '2': ['c', 'b', 'a', 'd'],
      '3': ['a', 'b', 'd', 'c'],
      '4': ['c', 'a', 'd', 'b'],
    }
    boys_ranks = {
      'a': ['1', '2', '3', '4'],
      'b': ['2', '1', '4', '3'],
      'c': ['2', '3', '1', '4'],
      'd': ['1', '4', '3', '2'],
    }

    obj = GaleShapley.new(girls_ranks, boys_ranks)
    results = obj.marriage
    assert_equal results.empty?, false
    assert_equal results.length, 4
    assert_equal results['1'].to_s , 'a'
    assert_equal results['2'].to_s , 'c'
    assert_equal results['3'].to_s , 'b'
    assert_equal results['4'].to_s , 'd'
  end
end
