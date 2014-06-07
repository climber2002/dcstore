require 'open-uri'

module CsvImporter
  DEFAULT_LOCATION = "https://dl.dropboxusercontent.com/u/6582068/products.csv"

  class ImportError < Exception; end;

  # Import a csv file from a remote location such as 
  # "https://dl.dropboxusercontent.com/u/6582068/products.csv" or from a
  # local file such as "#{Rails.root}/db/csv/products.csv", it returns true
  # if the import is successful, or false if any exceptions thrown during the 
  # import.
  # 
  # The csv file should have the following columns: ProductID, Category,
  # Product Name and Price, and the ProductID should be unique. 
  # The import is idempotent, which means that if the category or the product already
  # exists in database, it will be ignored
  def self.import csv_location = DEFAULT_LOCATION
    csv = SmarterCSV.process(open(csv_location.to_s))
    csv.each do |row|
      category_name = row.delete(:category)
      category = Category.find_or_create_by!(name: category_name)
      product = Product.find_by(productid: row[:productid])
      unless product
        product = Product.create!(row.merge(category: category))
      end
    end
    true
  rescue => e
    Rails.logger.error("Error when import from #{csv_location}: #{e}")
    false
  end

  # The function is the same as import, but it will raise an CsvImporter::ImportError
  # if the import is failed
  def self.import! csv_location = DEFAULT_LOCATION
    unless self.import csv_location
      raise ImportError, "Error occured when import from #{csv_location}", caller
    end
  end

end