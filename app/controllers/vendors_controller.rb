class VendorsController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    authorize @vender
  end

end
