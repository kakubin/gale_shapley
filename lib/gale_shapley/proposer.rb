# frozen_string_literal: true

class Proposer # :nodoc:
  attr_reader :name

  def initialize(name, preferences)
    @name = name
    @preferences = preferences
    @index = 0
    @engaged = false
  end

  def unengaged?
    !@engaged
  end

  def engage
    @engaged = true
  end

  def current_acceptor_name
    @preferences[@index]
  end

  def propose(acceptor)
    if acceptor.engaged?
      acceptor.more_attractive?(self) ? acceptor.engage(self) : free
    else
      acceptor.engage(self)
    end
  end

  def free
    @index += 1
    @engaged = false
  end
end
