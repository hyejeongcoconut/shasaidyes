# notice the `User::` here, so it won't conflict with devise controllers
class User::VendorsController < User::BaseController

  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @vendors = Vendor.all
    if params[:query].present?
      @vendors = Vendor.search_by_category_and_price_and_city(params[:query])
    else
      @vendors = Vendor.all
    end

    respond_to do |format|
      format.html
      format.json { render json: { vendors: @vendors } }
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
    authorize @vendor
  end

end
