# frozen_string_literal: true

class GaleShapley #:nodoc:
  def initialize(candidates_preferences, proposers_preferences)
    @pairs = {}
    @negotiation_counts = Hash.new(0)

    @candidates_preferences = candidates_preferences.transform_keys(&:to_s)
    @proposers_preferences = proposers_preferences.transform_keys(&:to_s)
  end

  def resolve
    loop do
      unallocateds = @proposers_preferences.keys - @pairs.values
      break if unallocateds.empty?

      unallocateds.each do |proposer|
        candidate = target_candidate(proposer)

        # if she has married
        opponent = @pairs[candidate]
        if opponent
          pairing(candidate, proposer) if she_change?(candidate, proposer, opponent)
        else # if he has no competitor
          pairing(candidate, proposer)
        end

        @negotiation_counts[proposer] += 1
      end
    end

    @pairs
  end

  private

  def target_candidate(proposer)
    position = @negotiation_counts[proposer]
    @proposers_preferences[proposer][position]
  end

  def pairing(assentor, proposer)
    @pairs[assentor] = proposer
  end

  def she_change?(assentor, proposer, opponent)
    proposer_rank = fetch_rank(assentor, proposer)
    opponent_rank = fetch_rank(assentor, opponent)
    proposer_rank < opponent_rank
  end

  def fetch_rank(assentor, man)
    @candidates_preferences[assentor].index(man)
  end
end
