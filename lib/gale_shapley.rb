require 'gale_shapley/version'

class GaleShapley
  def initialize(girls_ranks, boys_ranks)
    @girls_ranks = girls_ranks
    @boys_ranks = boys_ranks
    @pairs = {}
    @positions = {}
  end

  def marriage
    while true
      bachelors = @boys_ranks.keys - @pairs.values
      break if bachelors.empty?

      bachelors.each do |proposing_boy|
        # 現在の順位を取得
        position = @positions[proposing_boy] ||= 0
        girl = @boys_ranks[proposing_boy][position]

        # 既に相手がいる場合
        if @pairs.has_key?(girl)
          # 自分と敵対者の順位を調べて比較する
          girls_rank = @girls_ranks[girl.to_s.to_sym]
          my_rank = girls_rank.index(proposing_boy.to_s)
          opponent_rank = girls_rank.index(@pairs[girl].to_s)

          if my_rank < opponent_rank
            # pairの入れ替え
            @pairs[girl] = proposing_boy
          end

        else # 競合しなかった場合
          @pairs[girl] = proposing_boy
        end

        @positions[proposing_boy] += 1
      end
    end

    # @pairs.map { { _1 => _2.to_s } }
    @pairs
  end
end

require 'test/unit'

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
