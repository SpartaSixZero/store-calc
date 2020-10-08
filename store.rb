require_relative 'markup_calc'

class Store
  attr_reader :county_hash, :unit_sold_for_product_id_for_county_id_hash, :inventory_hash, :markup_per_county_id
  
  def initialize(county_hash, unit_sold_for_product_id_for_county_id_hash, inventory_hash, markup_per_county_id)
    @county_hash = county_hash
    @unit_sold_for_product_id_for_county_id_hash = unit_sold_for_product_id_for_county_id_hash
    @inventory_hash = inventory_hash
    @markup_per_county_id = markup_per_county_id
  end

  def total_profit
    profit = 0
    unit_sold_for_product_id_for_county_id_hash.each_pair do |county_id, units_sold_for_product_id|
      units_sold_for_product_id.each_pair do |product_id, units_sold|

        # Here, we are moving the logic to calculate price with markup inside our MarkupCalc class
        # the reason is to keep that logic separate for modularity as well as make it easier to write small
        # unit tests
        markup_calc = MarkupCalc.new(markup_per_county_id[county_id])
        price_after_markup = markup_calc.price_with_markup(inventory_hash[product_id].cost_price)

        # Similar to above, we're deferring the logic for calculating the amount of tax collected to
        # our county object. Since each county retains knowledge of their own tax rate, it made sense to
        # keep the logic in there
        price_with_tax = price_after_markup + county_hash[county_id].tax_collected(price_after_markup)

        profit += units_sold * price_with_tax
      end
    end
    profit
  end
end