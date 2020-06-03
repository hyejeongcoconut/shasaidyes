require "pry-byebug"
class Vendor::PagesController < Vendor::BaseController

  before_action :authenticate_vendor!

  def dashboard
    @vendor = current_vendor
    @products = Product.where(vendor_id: current_vendor.id)
    @favorites = FavoriteVendor.where(vendor_id: current_vendor.id)
    return @products, @favorites
  end

  #create new quote method
  def create
    @quote = Quote.new(quote_params)
    @vendor = Vendor.find(params[:page][:vendor_id])
    @user = User.find(params[:page][:user_id])
    @quote.vendor = @vendor
    @quote.user = @user
    @quote.save
    respond_to do |format|
      format.html
      format.json { render json: {quotes: @quote }}
    end
  end

  #update quote method
  def update

    @quote = Quote.find(params[:page][:id])
    @quote.update(quote_params)
    respond_to do |format|
      format.html
      format.json { render json: {quotes: @quote }}
    end
  end


  private

  def quote_params
    params.require(:page).permit(:user_id, :vendor_id,
                                 :total_price,
                                 :list_of_services,
                                 :date,
                                 :booked,
                                 :id)
  end
end
