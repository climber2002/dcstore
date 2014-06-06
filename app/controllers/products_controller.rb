class ProductsController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @products = @category.products.all.paginate(page: params[:page], per_page: 5)    
  end
end
