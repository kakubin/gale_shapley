# frozen_string_literal: true

require 'gale_shapley/proposer'
require 'gale_shapley/acceptor'

class GaleShapley # :nodoc:
  class UnproperSizeError < StandardError; end

  class << self
    def resolve(proposers_preferences, acceptors_preferences)
      init(proposers_preferences, acceptors_preferences)
      loop_til_stable

      @proposers.map { |proposer| [proposer.name, proposer.current_acceptor_name] }.to_h
    end

    private

    def init(proposers_preferences, acceptors_preferences)
      check_resolvablity(proposers_preferences, acceptors_preferences)

      proposers_preferences = proposers_preferences.transform_keys(&:to_s)
      acceptors_preferences = acceptors_preferences.transform_keys(&:to_s)

      @proposers = proposers_preferences.map do |name, preferences|
        Proposer.new(name, preferences)
      end
      @acceptors = acceptors_preferences.map do |name, preferences|
        Acceptor.new(name, preferences)
      end
    end

    def check_resolvablity(proposers_preferences, acceptors_preferences)
      size = proposers_preferences.keys.size

      unless acceptors_preferences.keys.size == size &&
             acceptors_preferences.all? { |_, preference| preference.size == size } &&
             proposers_preferences.all? { |_, preference| preference.size == size }
        raise UnproperSizeError, "can't resolve due to preference size"
      end
    end

    def loop_til_stable
      loop do
        unengageds = @proposers.select(&:unengaged?)
        break if unengageds.empty?

        unengageds.each do |proposer|
          name = proposer.current_acceptor_name
          target = @acceptors.find { |acceptor| acceptor.name == name }
          proposer.propose(target)
        end
      end
    end
  end
end
