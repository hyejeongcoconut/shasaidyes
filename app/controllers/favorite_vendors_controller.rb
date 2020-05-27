class FavoriteVendorsController < ApplicationController
  def create
    @user = User.find(params[:favorite_vendor][:user_id])
    @vendor = Vendor.find(params[:favorite_vendor][:vendor_id])
    @favorite_vendor = FavoriteVendor.new
    @favorite_vendor.user = @user
    @favorite_vendor.vendor = @vendor
    @favorite_vendor.save
    redirect_to vendors_path
  end

  private

  def favorite_vendor_params
    params.require(:favorite_vendor).permit(:user_id,:vendor_id)
  end
end
