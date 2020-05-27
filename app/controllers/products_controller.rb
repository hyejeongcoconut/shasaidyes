class ProductsController < ApplicationController
  def index
    @products = Product.where(vendor_id: current_user.id)
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.new
    @product.vendor = @vendor
  end

  def create
    @product = Product.new(product_params)
    @vendor = Vendor.find(params[:vendor_id])
    @product.vendor = @vendor
    @product.save
    redirect_to user_products_path
  end

  def edit
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:id])
    @Product.vendor = @vendor
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to vendor_products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to vendor_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name,
                                    :price,
                                    :description,
                                    :category,
                                    )
  end
end
