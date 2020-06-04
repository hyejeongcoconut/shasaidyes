class Vendor::InboxesController < Vendor::BaseController
  def index
    @vendor = Vendor.find(current_vendor.id)
    @inbox = Inbox.all
    @favorites = FavoriteVendor.where(vendor_id: current_vendor.id)
  end

  def show
    @vendor = Vendor.find(current_vendor.id)
    @inbox = Inbox.find(params[:id])
    @message = Message.new
  end
end
