require_relative 'product'
require_relative 'county'
require_relative 'store'

# Instantiate the three counties so that we can later utilize them for their tax rates and their ids
miami_dade_county = County.new(1, "Miami-Dade", 0.06)
palm_beach_county = County.new(2, "Palm Beach", 0.08)
broward_county = County.new(3, "Broward", 0.07)

# Instantiate our product so that we can later use the cost price
clorox_wipes = Product.new(1, "Clorox", "Disinfectant Wipes", 30)

inventory_hash = { 1 => clorox_wipes }

county_hash = {
  miami_dade_county.id => miami_dade_county,
  palm_beach_county.id => palm_beach_county,
  broward_county.id => broward_county
}

unit_sold_for_product_id_for_county_id = {
  1 => { 1 => 100 },
  2 => { 1 => 100 },
  3 => { 1 => 100 }, 
}

markup_per_county_id = {
  1 => 0.25,
  2 => 0.30,
  3 => 0.30,
}

st_bernard_corner_store = Store.new(county_hash, unit_sold_for_product_id_for_county_id, inventory_hash, markup_per_county_id)

puts "total profit: "
puts "--------------"
puts st_bernard_corner_store.total_profit