class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    params[:product][:category_ids].each do |category_id|
      category = Category.find(category_id)
      @product.categories << category
    end
    
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.categories.delete_all
    params[:product][:category_ids].each do |category_id|
        category = Category.find(category_id)
        @product.categories << category
    end

    if @product.update(product_params)
        redirect_to products_path
    else
        render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path        
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, category_ids: [])
    end
end
