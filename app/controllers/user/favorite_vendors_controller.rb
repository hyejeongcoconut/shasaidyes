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

  def destroy
    @favorite_vendor = FavoriteVendor.find(params[:id])
    @favorite_vendor.user = current_user
    @favorite_vendor.destroy

    # no need for app/views/favorite_vendors/destroy.html.erb
    redirect_to user_dashboard_path
  end

  private

  def favorite_vendor_params
    params.require(:favorite_vendor).permit(:user_id,:vendor_id)
  end
end
