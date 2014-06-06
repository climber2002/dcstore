class ImportController < ApplicationController
  IMPORT_URL = "https://dl.dropboxusercontent.com/u/6582068/products.csv"

  def start
    
  end

  def import
    if CsvImporter.import IMPORT_URL
      flash[:notice] = "Import Complete"
    else
      flash[:error] = "Import Failed"
    end
    redirect_to start_path
  end
end
