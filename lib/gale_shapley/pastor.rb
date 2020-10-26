module Pastor
  def initialize
    @bachelors = bachelors
    @bachelorettes = bachelorettes
  end

  def make
    while is_there_bachelor? do
      bachelorette_name = one_of_bachelors.prefer
      bachelorette = @bachelorettes.find { _1.name == bachelorette_name }
      if bachelorette.better?(one_of_bachelors)
        bachelorette.partner = one_of_bachelors
        one_of_bachelors.partner = bachelorette
      else
        one_of_bachelors.is_hated += 1
      end
    end
  end

  private

  def is_there_bachelor?
    @bachelors.any(&:bachelor?)
  end

  def one_of_bachelors
    @bachelors.select(&:bachelor?).first
  end
end
