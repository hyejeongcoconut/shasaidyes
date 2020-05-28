class User::FavoriteVendorsController < User::BaseController
  #before_action :authenticate_user!, only: [ :create ]

  def create
    @vendor = Vendor.find(params[:favorite_vendor][:vendor_id])
    @favorite_vendor = FavoriteVendor.new
    @favorite_vendor.user = current_user
    @favorite_vendor.vendor = @vendor

    @favorite_vendor.save
    #redirect_to vendors_path
    respond_to do |format|
      format.html
      format.json { render json: { favorite_vendors: @favorite_vendor } }
    end
  end

  private

  def favorite_vendor_params
    params.require(:favorite_vendor).permit(:user_id,:vendor_id)
  end
end
