# frozen_string_literal: true

class GaleShapley # :nodoc:
  class Acceptor # :nodoc:
    attr_accessor :name, :proposer

    def initialize(name, preferences)
      @name = name
      @preferences = preferences
      @proposer = nil
    end

    def engaged?
      !!@proposer
    end

    def engage(proposer)
      @proposer&.free
      @proposer = proposer
      @proposer.engage
    end

    def more_attractive?(proposer)
      @preferences.index(proposer.name) < @preferences.index(@proposer.name)
    end
  end
end
