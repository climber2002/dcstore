class ProductsController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @products = @category.products.order(:product_name).paginate(page: params[:page], per_page: 5)    
  end

  def show
    @product = Product.find params[:id]
  end
end
