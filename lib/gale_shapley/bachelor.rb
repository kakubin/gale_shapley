class Bachelor
  attr_accessor :name, :preference, :partner, :is_hated

  def initialize(name, preference)
    @name = name
    @preference = preference
    @partner = nil
    @is_hated = 0
  end

  def bachelor?
    @partner.nil?
  end

  def prefer
    @preference[@is_hated]
  end
end
