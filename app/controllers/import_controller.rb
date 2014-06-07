class ImportController < ApplicationController

  def start
    
  end

  def import
    if CsvImporter.import
      flash[:notice] = "Import Complete"
    else
      flash[:error] = "Import Failed"
    end
    redirect_to start_path
  end
end
