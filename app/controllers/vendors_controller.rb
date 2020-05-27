class VendorsController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @vendors = Vendor.all
    if params[:query].present?
      @vendors = Vendor.search_by_category_and_price_and_city(params[:query])
    else
      @vendors = Vendor.all
    end
  end

  def new
    @vendor = Vendor.new
    authorize @vender
  end

  def show
    @vendor = Vendor.find(params[:id])
    authorize @vender
  end

  def create
    @vendor = Vendor.new(vendor_params)
    @vendor.save
    authorize @vender
  end

  def edit
    @vendor = Vendor.find(params[:id])
    authorize @vendor
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.update(vendor_params)
    authorize @vendor
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    authorize @vender
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :category, :phone_number, :description, :email)
  end
end
