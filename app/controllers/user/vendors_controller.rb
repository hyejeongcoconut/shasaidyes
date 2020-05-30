# notice the `User::` here, so it won't conflict with devise controllers
class User::VendorsController < User::BaseController

  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @vendors = Vendor.all
    if params[:query].present?
      @vendors = Vendor.search_by_category_and_price_and_city(params[:query])
      #@vendors = get_category(@vendors_query)
    else
      @vendors = Vendor.all
      #@vendors = get_category(@vendors_query)
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  private

  def get_category(vendors)
    categories_hash = {}
    @vendors.group_by(&:category)
    vendors.each { |vendor| categories_hash["#{vendor.category}"] = []  }
    categories_hash
    make_category_object(categories_hash, vendors)
  end

  def make_category_object(categories_hash, vendors)
    vendors.each do |vendor|
      categories_hash.each do |value, key|
        categories_hash["#{value}"] << vendor if vendor.category == value
      end
    end
    return categories_hash
  end
end

