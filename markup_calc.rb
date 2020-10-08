class MarkupCalc
  attr_reader :markup_amount

  def initialize(markup_amount)
    @markup_amount = markup_amount
  end

  def price_with_markup(base_price)
    base_price + base_price * markup_amount
  end
end