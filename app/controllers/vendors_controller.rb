class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def create
    @vendor = Vendor.new(vendor_params)
    @vendor.save
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :category, :phone_number, :description, :email)
  end
end
