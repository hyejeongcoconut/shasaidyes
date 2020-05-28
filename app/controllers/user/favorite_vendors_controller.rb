class User::FavoriteVendorsController < User::BaseController
  def create
    @vendor = Vendor.find(params[:favorite_vendor][:vendor_id])
    @favorite_vendor = FavoriteVendor.new
    @favorite_vendor.user = current_user
    @favorite_vendor.vendor = @vendor
    if @favorite_vendor.save
      redirect_to vendors_path
    else

    end
  end

  private

  def favorite_vendor_params
    params.require(:favorite_vendor).permit(:user_id,:vendor_id)
  end
end
