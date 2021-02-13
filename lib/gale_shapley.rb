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
        if opponent = @pairs[girl]&.to_s
          # 自分と敵対者の順位を調べて比較する
          my_rank = mans_priority(girl, proposing_boy)
          opponent_rank = mans_priority(girl, opponent)

          if my_rank < opponent_rank
            she_is_mine(girl, proposing_boy)
          end

        else # 競合しなかった場合
          she_is_mine(girl, proposing_boy)
        end

        @positions[proposing_boy] += 1
      end
    end

    @pairs.keys.each do
      @pairs[_1] = @pairs[_1].to_s
    end
    @pairs
  end

  private

  def she_is_mine(girl, me)
    @pairs[girl] = me
  end

  def mans_priority(girl, man)
    @girls_ranks[girl.to_s.to_sym].index(man.to_s)
  end
end
