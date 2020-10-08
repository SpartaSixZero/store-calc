require_relative '../markup_calc'

RSpec.describe MarkupCalc, "#price_with_markup" do
  context "with a base price of 10 and a markup of .30" do
    it "returns the correct price with markup" do
      markup_calc = MarkupCalc.new(0.30)
      expect(markup_calc.price_with_markup(10)).to eq 13
    end
  end
end
