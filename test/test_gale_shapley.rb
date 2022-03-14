# frozen_string_literal: true

require 'test/unit'
require 'gale_shapley'

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

    results = GaleShapley.resolve(girls_ranks, boys_ranks)
    assert_equal results.empty?, false
    assert_equal results.length, 4
    assert_equal results['1'], 'a'
    assert_equal results['2'], 'c'
    assert_equal results['3'], 'b'
    assert_equal results['4'], 'd'
  end

  def test_size_error
    girls_ranks = {
      '1': ['a', 'b'],
      '2': ['c', 'b', 'a'],
      '3': ['a', 'b', 'c'],
      '4': ['c', 'a', 'b']
    }
    boys_ranks = {
      'a': ['1', '2', '3', '4'],
      'b': ['2', '1', '4', '3'],
      'c': ['2', '3', '1', '4']
    }

    e = assert_raises GaleShapley::UnproperSizeError do
      GaleShapley.resolve(girls_ranks, boys_ranks)
    end
    assert_equal "can't resolve due to preference size", e.message
  end

  def test_kanji
    girls_ranks = {
      '結衣': ['孟', '進次郎', '太郎'],
      '恵': ['進次郎', '太郎', '孟'],
      '剛力': ['太郎', '孟', '進次郎'],
    }
    boys_ranks = {
      '太郎': ['結衣', '剛力', '恵'],
      '進次郎': ['結衣', '剛力', '恵'],
      '孟': ['剛力', '結衣', '恵'],
    }

    results = GaleShapley.resolve(girls_ranks, boys_ranks)
    assert_equal results.empty?, false
    assert_equal results.length, 3
    assert_equal results['結衣'], '孟'
    assert_equal results['恵'], '進次郎'
    assert_equal results['剛力'], '太郎'
  end
end
