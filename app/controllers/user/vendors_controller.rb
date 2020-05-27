# notice the `User::` here, so it won't conflict with devise controllers
class User::VendorsController < User::BaseController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    authorize @vendor
  end
end
