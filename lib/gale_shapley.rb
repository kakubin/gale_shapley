require 'gale_shapley/version'

def marriage(girls_ranks, boys_ranks)
  pairs = {} # girlがキー
  positions = {} # boyがキー

  while true
    bachelors = boys_ranks.keys - pairs.values
    break if bachelors.empty?

    bachelors.each do |proposing_boy|
      # 現在の順位を取得
      position = positions[proposing_boy] ||= 0
      girl = boys_ranks[proposing_boy][position]

      # 既に相手がいる場合
      if pairs.has_key?(girl)
        # 自分と敵対者の順位を調べて比較する
        girls_rank = girls_ranks[girl.to_s.to_sym]
        my_rank = girls_rank.index(proposing_boy.to_s)
        opponent_rank = girls_rank.index(pairs[girl].to_s)

        if my_rank < opponent_rank
          # pairの入れ替え
          pairs[girl] = proposing_boy
        end

      else # 競合しなかった場合
        pairs[girl] = proposing_boy
      end

      positions[proposing_boy] += 1
    end
  end

  # pairs.map { { _1 => _2.to_s } }
  pairs
end

girls_ranks = {
  '1': ['a', 'b', 'c', 'd'],
  '2': ['c', 'b', 'a', 'd'],
  '3': ['a', 'b', 'd', 'c'],
  '4': ['c', 'a', 'd', 'b'],
}
# 各男性の好み。
boys_ranks = {
  'a': ['1', '2', '3', '4'],
  'b': ['2', '1', '4', '3'],
  'c': ['2', '3', '1', '4'],
  'd': ['1', '4', '3', '2'],
}

results = marriage(girls_ranks, boys_ranks)

puts 'falte' if results.nil?
puts 'falte' unless results.length == 4
puts 'falte' unless results['1'].to_s == 'a'
puts 'falte' unless results['2'].to_s == 'c'
puts 'falte' unless results['3'].to_s == 'b'
puts 'falte' unless results['4'].to_s == 'd'
