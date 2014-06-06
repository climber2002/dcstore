require 'spec_helper'

describe CsvImporter do

  context "import" do
    it "should be able to import categories from a local file" do
      category_names = ['Cameras', 'WhiteGoods', 'Audio', 'Computers and Tablets']
      category_names.each do |category_name|
        expect(Category.find_by(name: category_name)).to be_nil
      end

      expect(CsvImporter.import "#{Rails.root}/db/csv/products.csv").to be_true

      category_names.each do |category_name|
        expect(Category.find_by(name: category_name)).not_to be_nil
      end
    end
    
    it "should be able to import products from a local file" do 
      expect do 
        CsvImporter.import "#{Rails.root}/db/csv/products.csv"
      end.to change{Product.count}.from(0).to(17)
    end

    it "should return false from a non exist location" do
      expect(CsvImporter.import "#{Rails.root}/db/csv/nonexist.csv").to be_false
    end

    it "should be able to import from a remote file" do
      expect do 
        CsvImporter.import "https://dl.dropboxusercontent.com/u/6582068/products.csv"
      end.to change{Product.count}.from(0).to(17)
    end
  end

  context "import!" do 
    it "shouldn't throw exception when import! from a valid remote location" do
      expect do 
        CsvImporter.import! "https://dl.dropboxusercontent.com/u/6582068/products.csv"
      end.to change{Product.count}.from(0).to(17)
    end

    it "should throw an ImportError when import! from a non exist location" do
      expect do
        CsvImporter.import! "https://dl.dropboxusercontent.com/u/6582068/nonexist.csv"
      end.to raise_error(CsvImporter::ImportError)
    end
  end
end