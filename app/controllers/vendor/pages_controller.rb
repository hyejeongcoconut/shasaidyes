class Vendor::PagesController < Vendor::BaseController
  def dashboard
    @vendor = current_vendor
    @products = Product.where(vendor_id: @vendor.id).all
  end
end
