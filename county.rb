class County
  attr_reader :id, :taxrate, :name

  def initialize(id, name, taxrate)
    @id = id
    @name = name
    @taxrate = taxrate
  end

  def tax_collected(base_price)
    base_price * taxrate
  end
end