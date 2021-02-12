require_relative './gale_shapley/version'

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
            she_is_my_girl(girl, proposing_boy)
          end

        else # 競合しなかった場合
          she_is_my_girl(girl, proposing_boy)
        end

        @positions[proposing_boy] += 1
      end
    end

    # @pairs.map { { _1 => _2.to_s } }
    @pairs
  end

  private

  # pairの入れ替え
  def she_is_my_girl(girl, me)
    @pairs[girl] = me
  end
end

