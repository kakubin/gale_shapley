class Bachelorette
  attr_accessor :name, :preference, :partner

  def initialize(name, preference)
    @name = name
    @preference = preference
    @partner = nil
  end

  def better?(new_man)
    return true if @partner.nil?

    @preference.index(new_man) < @preference.index(@partner)
  end
end
