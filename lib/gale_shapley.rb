class GaleShapley
  def initialize(girls_ranks, boys_ranks)
    @girls_ranks = {}
    @boys_ranks = {}
    @pairs = {}
    @positions = Hash.new(0)

    girls_ranks.keys.each do
      @girls_ranks[_1.to_s] = girls_ranks[_1]
    end
    boys_ranks.keys.each do
      @boys_ranks[_1.to_s] = boys_ranks[_1]
    end
  end

  def marriage
    while true
      bachelors = @boys_ranks.keys - @pairs.values
      break if bachelors.empty?

      bachelors.each do |proposing_boy|
        girl = target_girl(proposing_boy)

        # 既に相手がいる場合
        if opponent = @pairs[girl]
          if she_change?(girl, proposing_boy, opponent)
            she_is_mine(girl, proposing_boy)
          end

        else # 競合しなかった場合
          she_is_mine(girl, proposing_boy)
        end

        @positions[proposing_boy] += 1
      end
    end

    @pairs
  end

  private

  def target_girl(proposing_boy)
    position = @positions[proposing_boy]
    @boys_ranks[proposing_boy][position]
  end

  def she_is_mine(girl, me)
    @pairs[girl] = me
  end

  def she_change?(girl, proposer, opponent)
    proposer_rank = mans_priority(girl, proposer)
    opponent_rank = mans_priority(girl, opponent)

    proposer_rank < opponent_rank
  end

  def mans_priority(girl, man)
    @girls_ranks[girl].index(man)
  end
end
