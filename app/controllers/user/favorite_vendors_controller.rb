class User::FavoriteVendorsController < User::BaseController

  #before_action :authenticate_user!, only: [ :create ]

  def index
    @user = current_user
    @favorites = FavoriteVendor.where(user_id: current_user)
  end

  def create
    @vendor = Vendor.find(params[:favorite_vendor][:vendor_id])
    @favorite_vendor = FavoriteVendor.new
    @favorite_vendor.user = current_user
    @favorite_vendor.vendor = @vendor
    @favorite_vendor.save
    create_quote(current_user.id,params[:favorite_vendor][:vendor_id])
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

  def create_quote(user_id, vendor_id)
    @quote = Quote.new(total_price: 0,
                       list_of_services: "",
                       date: "",
                       booked: 0,
                       vendor_id: vendor_id,
                       user_id: user_id)
    @quote.save
  end
end
