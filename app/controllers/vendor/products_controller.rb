class Vendor::ProductsController < Vendor::BaseController
  # https://github.com/varvet/pundit/blob/df96d2ae6bcf28991c1501d5ff0bde4c42aa4acd/lib/pundit.rb#L217-L227
  # https://github.com/varvet/pundit/blob/df96d2ae6bcf28991c1501d5ff0bde4c42aa4acd/lib/pundit.rb#L261-L263
  # skip_before_action :authenticate_vendor!, only: [ :index, :show ]
  # if we specify `policy_class` option,
  # pundit use it:
  # policy_class.new(pundit_user, record)

  # if we override `pundit_user`
  # the authorize check becomes:
  # VendorItemPolicy.new(current_vendor, @item).update?

  skip_before_action :authenticate_vendor!, only: [:index, :show, ]
  def index
    @vendor = Vendor.find(current_vendor.id)
    @products = Product.where(vendor_id: current_vendor.id)
  end

  def new
    @vendor = current_vendor
    @product = Product.new
    @product.vendor = @vendor
  end

  def create
    @product = Product.new(product_params)
    @product.vendor = current_vendor
    @product.save
    redirect_to vendor_products_path
  end

  def edit
    @vendor = Vendor.find(current_vendor.id)
    @product = Product.find(params[:id])
    @product.vendor = @vendor
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to vendor_products_path
  end

  def show
    if current_vendor
      @vendor = Vendor.find(current_vendor.id)
    end
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to vendor_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :category, photos:[])
  end
end
