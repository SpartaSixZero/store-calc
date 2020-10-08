class Product
  attr_reader :id, :brand_name, :product_name, :cost_price
  
  def initialize(id, brand_name, product_name, cost_price)
    @id = id
    @brand_name = brand_name
    @product_name = product_name
    @cost_price = cost_price
  end
end