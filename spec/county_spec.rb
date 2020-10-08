require_relative '../county'

RSpec.describe County, "#tax_collected" do
  context "with a base price of 10 and a tax rate of 0.05" do
    it "returns the correct taxed amount" do
      county = County.new(1, "County 1", 0.05)
      expect(county.tax_collected(10)).to eq 0.5
    end
  end
end
