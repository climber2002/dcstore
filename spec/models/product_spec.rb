require 'spec_helper'

describe Product do

  describe "Validation" do 
    it "should be able to create a valid product" do
      expect(FactoryGirl.create(:product)).to be_valid
    end

    it "should be invalid if the product name is empty" do
      product = FactoryGirl.build(:product, product_name: "   ")
      expect(product).to be_invalid
      expect(product).to have(1).errors_on(:product_name)
    end

    it "should be invalid if the product name is nil" do
      product = FactoryGirl.build(:product, product_name: nil)
      expect(product).to be_invalid
      expect(product).to have(1).errors_on(:product_name)
    end

    it "should be invalid if the product has no category" do
      product = FactoryGirl.build(:product, category: nil)
      expect(product).to be_invalid
      expect(product).to have(1).errors_on(:category)
    end

    it "should be invalid if the price is 0" do
      expect(FactoryGirl.build(:product, price: 0)).to have(1).errors_on(:price)
    end

    it "should be invalid if the price is negative" do
      expect(FactoryGirl.build(:product, price: -100)).to have(1).errors_on(:price)
    end
  end

end